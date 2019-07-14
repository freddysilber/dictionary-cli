# CLI Controller
# ./bin/dictionary
# show_welcome_message
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
        # display_word
        # ask if user wants to search again
    end

    def show_word_the_day
        puts "Welcome to Merriam Webster online Dictionary!"
        puts "The word of the day is:"
        @word = Dictionary::Word.today
        puts "--- #{@word.word_name}"
        puts "------ #{@word.part_of_speech}"
        puts "------ Definition A: #{@word.definition}"
    end
    
    def get_user_input
        puts "-- Search for a word..."
        input = gets.downcase.strip
        puts "-- The word you searched is #{input}. Is that correct? (Y/N)"
        confirmation = gets.downcase.strip
        if confirmation == "N" || confirmation == "n" || confirmation == "no" || confirmation == "NO"
            get_user_input
        else
            @word_to_search = input
        end
    end

    def search_for_word
        puts "-- Searching for word: #{@word_to_search}..."
        @word_searched = Dictionary::Word.search_for_word(@word_to_search)
        #word_searched.word_name
        #word_searched.part_of_speech etc..
        display_word
    end

    def display_word
        puts "--- #{@word_searched.word_name}"
    end
end