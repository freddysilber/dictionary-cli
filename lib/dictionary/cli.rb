# CLI Controller
class Dictionary::CLI
    def call
        welcome_message
        get_todays_word
        show_word_of_the_day
        get_user_input
        find_word
        show_searched_word
        search_again?
    end
    def welcome_message
        puts "\n----------------------------------------------------------------".cyan
        puts
        puts "\tWelcome to Merriam Webster online Dictionary!".colorize(:light_magenta)
        puts
        puts "\tDate: #{Date.today}".colorize(:light_yellow)
        puts
        puts "\tThe word of the day is:".colorize(:light_yellow)
    end
    def get_todays_word
        w = Dictionary::Word.todays_word
        @word_of_the_day = w
        if @word_of_the_day == nil || @word_of_the_day == []
            word = Dictionary::Scraper.get_word_of_day
            w = Dictionary::Word.new_word_of_the_day(word)
            @word_of_the_day = w
        end
    end
    def show_word_of_the_day
        puts "\n-- Word: #{@word_of_the_day.word_name.capitalize.colorize(:light_green)}"
        puts "---- Part of Speech: #{@word_of_the_day.part_of_speech.capitalize.colorize(:light_green)}"
        puts "---- Pronounciation: '#{@word_of_the_day.pronounciation.colorize(:light_green)}'"
        puts "---- Definition: #{@word_of_the_day.definition.colorize(:light_green)}"
        puts "\n----------------------------------------------------------------".cyan
    end
    def get_user_input
        exit_input = "exit".colorize(:light_red)
        puts "\n-- Search for a word or type '#{exit_input}' . . ."
        puts
        input = gets.downcase.strip
        puts
        if input == "exit"
            @exit = true
            return "See you later!"
        else 
            yes = "Y".colorize(:light_green)
            no = "N".colorize(:red)
            puts "-- The word you searched is #{input.upcase.colorize(:light_yellow)}. Is that correct? (#{yes}/#{no})"
            puts
            confirmation = gets.downcase.strip
            if confirmation == "N" || confirmation == "n" || confirmation == "no" || confirmation == "NO"
                get_user_input
            else
                @word_to_search = input
            end
        end
    end
    def find_word
        if @exit != true
            search = @word_to_search.downcase
            @searched = Dictionary::Word.find_a_word(search.downcase)
            if @searched == nil || @searched == []
                word = Dictionary::Scraper.search_for_word(search)
                if word != nil
                    w = Dictionary::Word.new_word_from_search(word)
                    @searched = w
                else
                    puts "Sorry we couldn't find the word you searched. Please try again or change spelling.".red
                end                
            end
        end
    end
    def show_searched_word
        if @exit != true && @searched != nil
            counter = 1
            formatted = []
            sections = @searched.definition.split(":")
            sections.delete_if(&:empty?)
            puts "\n----------------------------------------------------------------".cyan
            puts "\n-- Word: #{@searched.word_name.capitalize.colorize(:light_green)}"
            puts "---- Part of Speech: #{@searched.part_of_speech.capitalize.colorize(:light_green)}"
            puts "---- Pronounciation: '#{@searched.pronounciation.colorize(:light_green)}'"
            puts "---- Definition:"
            puts
            for i in sections do
                sec = i.split
                first_word = sec[0].capitalize
                sec.shift
                sec.unshift(first_word)
                s = sec.join(" ")
                formatted << s
            end
            formatted.each {|f|
                puts "\t" + "\t#{counter}. #{f}".colorize(:light_green)
                puts
                counter += 1
            }
        end
    end
    def search_again?
        if @exit != true
            yes = "Y".colorize(:light_green)
            no = "N".colorize(:red)
            puts "----------------------------------------------------------------".cyan
            puts "\n--- Would you like to search for another word? (#{yes}/#{no})"
            puts
            input = gets.strip
            if input == "N" || input == "n" || input == "NO" || input == "no"
                puts
                goodbye_message
                puts
            else
                self.call
            end
        else
             goodbye_message
        end
    end
    def goodbye_message
        puts "----------------------------------------------------------------".cyan
        puts "See you later!".colorize(:light_yellow)
        puts "----------------------------------------------------------------".cyan
        puts
    end 
end