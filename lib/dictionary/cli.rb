# CLI Controller
class Dictionary::CLI

    #####################
    def call
        @word_of_the_day = nil
        @word_to_search = nil
        @word_searched = nil
        @exit = nil
        show_word_the_day
        get_user_input
        search_for_word
        search_again?
    end
    #####################

    def show_word_the_day
        puts "\nWelxome to Merriam Webster online Dictionary!"
        puts Date.today
        puts "\nThe word of the day is:"
        # @word_of_the_day = Dictionary::Word.todays_word
        # puts @word_of_the_day
        if @word_of_the_day == nil
            @word_of_the_day = Dictionary::Scraper.get_word_of_day
            Dictionary::Word.new_word_of_the_day(@word_of_the_day)
            puts "\n--- #{@word_of_the_day[:word_name]}"
            puts "------ #{@word_of_the_day[:part_of_speech]}"
            puts "------ #{@word_of_the_day[:pronounciation]}"
            puts "------ #{@word_of_the_day[:definition]}"
        else
            puts "\n--- #{@word_of_the_day[:word_name]}"
            puts "------ #{@word_of_the_day[:part_of_speech]}"
            puts "------ #{@word_of_the_day[:pronounciation]}"
            puts "------ #{@word_of_the_day[:definition]}"
        end

    end
    
    def get_user_input
        puts "\n-- Search for a word or type 'exit'..."
        puts
        input = gets.downcase.strip
        puts
        if input == "exit"
            @exit = true
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
            @word_searched = Dictionary::Scraper.search_for_word(@word_to_search)
            if @word_searched[:word_name] != nil && @word_searched[:part_of_speech] != nil
                Dictionary::Word.new_word_from_search(@word_searched)
                # puts @word_searched[:definition].split(":")
                puts "\n--- #{@word_searched[:word_name]}"
                puts "------ #{@word_searched[:part_of_speech]}"
                puts "------ #{@word_searched[:pronounciation]}"
                puts "------ #{@word_searched[:definition]}"
            end
        end
    end

    def search_again?
        if @exit != true
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