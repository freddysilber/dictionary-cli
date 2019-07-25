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
        puts
        puts "\nWelxome to Merriam Webster online Dictionary!"
        puts "Date: #{Date.today}"
        puts
        puts "\tThe word of the day is:"
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
        puts "\n--- Word: #{@word_of_the_day.word_name.upcase}"
        puts "------ Part of Speech: #{@word_of_the_day.part_of_speech}"
        puts "------ Pronounciation: #{@word_of_the_day.pronounciation}"
        puts "------ Definition: #{@word_of_the_day.definition}"
    end
    def get_user_input
        puts
        puts "\n-- Search for a word or type 'exit' . . ."
        puts
        input = gets.downcase.strip
        puts
        if input == "exit"
            @exit = true
            return "See you later!"
        else 
            puts "-- The word you searched is #{input.upcase}. Is that correct? (Y/N)"
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
            @searched = Dictionary::Word.find_a_word(search)
            if @searched == nil || @searched == []
                word = Dictionary::Scraper.search_for_word(search)
                w = Dictionary::Word.new_word_from_search(word)
                @searched = w
            end
        end
    end
    def show_searched_word
        if @exit != true
            puts "\n--- Word: #{@searched.word_name.upcase}"
            puts "------ Part of Speech: #{@searched.part_of_speech}"
            puts "------ Pronounciation: #{@searched.pronounciation}"
            puts "------ Definition: #{@searched.definition}"
        end
    end
    def search_again?
        if @exit != true
            puts
            puts "\n----------------------------------------------------"
            puts "--- Would you like to search for another word? (Y/N)"
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
        puts "See you later!"
    end 
end