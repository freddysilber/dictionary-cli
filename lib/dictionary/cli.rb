# CLI Controller
class Dictionary::CLI
    def call  
        show_word_the_day
        get_user_input
        search_for_word
        search_again?
    end

    def show_word_the_day
        puts "\n Welxome to Merriam Webster online Dictionary!"
        puts Date.today
        puts "the word of the day is : \n"
        @word = Dictionary::Word.word_of_the_day
        puts "--- #{@word.word_name}"
        puts "------ #{@word.part_of_speech}"
        puts "------ #{@word.pronounciation}"
        puts "------ #{@word.definition} \n"
        # puts "\n Welcome to Merriam Webster online Dictionary!"
        # puts Date.today
        # puts "The word of the day is: \n"
        # @word = Dictionary::Word.today
        # puts "--- #{@word.word_name}"
        # puts "------ #{@word.part_of_speech}"
        # puts "------ #{@word.pronounciation}"
        # puts "------ Definition: #{@word.definition} \n"


        # puts Dictionary::Word.all
        # @word_of_the_day = Dictionary::Word.word_of_the_day
        # puts @word_of_the_day
        # @word = Dictionary::Scraper.get_word_of_day
        # puts @word

        # puts "--- #{@word.word_name}"
        # puts "------ #{@word.part_of_speech}"
        # puts "------ #{@word.pronounciation}"
        # puts "------ Definition: #{@word.definition} \n"
    end
    
    def get_user_input
        puts "\n-- Search for a word or type 'exit'..."
        input = gets.downcase.strip
        puts
        if input == "exit"
            @exit = true
            # goodbye_message
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

    def search_for_word
        if @word_to_search != nil
            puts "\n -- Searching for word: #{@word_to_search.upcase}..."
            @word_searched = Dictionary::Word.search_for_word_merriam(@word_to_search)
            puts "\n --- #{@word_searched.word_name}"
            puts "------ #{@word_searched.part_of_speech}"
            puts "------ #{@word_searched.pronounciation}"
            puts "------ Definition: #{@word_searched.definition} \n"
        end
    end

    def search_again?
        if @exit != true
            puts "\n ----------------------------------------------------"
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