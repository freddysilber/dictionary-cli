# CLI Controller
# ./bin/dictionary
# show_word_the_day
# ask for user input
# user searches
# shows word and deffinition
# asks to search again (and if previous word has no results)
# user can exit at any time
class Dictionary::CLI
    def call  
        show_word_the_day
        get_user_input
        search_for_word
        search_again?
        # ask if user wants to search again
    end

    def show_word_the_day
        puts
        puts "Welcome to Merriam Webster online Dictionary!"
        puts "The word of the day is:"
        puts
        @word = Dictionary::Word.today
        puts "--- #{@word.word_name}"
        puts "------ #{@word.part_of_speech}"
        puts "------ Definition A: #{@word.definition}"
        puts
    end
    
    def get_user_input
        puts
        puts "-- Search for a word..."
        input = gets.downcase.strip
        puts
        puts "-- The word you searched is #{input}. Is that correct? (Y/N)"
        confirmation = gets.downcase.strip
        if confirmation == "N" || confirmation == "n" || confirmation == "no" || confirmation == "NO"
            get_user_input
        else
            @word_to_search = input
        end
    end

    def search_for_word
        puts
        puts "-- Searching for word: #{@word_to_search}..."
        @word_searched = Dictionary::Word.search_for_word(@word_to_search)
        display_word
    end

    def display_word
        puts
        puts "--- #{@word_searched.word_name}"
        puts "------ #{@word_searched.part_of_speech}"
        puts "------ #{@word_searched.definition}"
        puts 
    end

    def search_again?
        puts "----------------------------------------------------"
        puts "--- Would you like to search for another word? (Y/N)"
        input = gets.strip
        if input == "N" || input == "n" || input == "NO" || input == "no"
            puts "See you later!"
        else
            self.call
        end
    end
end