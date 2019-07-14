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
        search_for_word
    end

    def show_word_the_day
        puts "The word of the day is:"
        puts "Cat -- noun"
        puts "show definition here"
        @word = Dictionary::Word.today
    end

    def search_for_word
        puts "Search for a word..."
        input = gets.upcase.strip
        puts "You searched #{input}. Is that correct? (Y/N)"
        confirmation = gets.upcase.strip
        puts confirmation
    end
end