require_relative 'scraper.rb'
class Dictionary::Word
    attr_accessor :date, :word_name, :part_of_speech, :definition, :pronounciation
    @@all = []
    @@words_of_the_day = []
    @@searched_words = []

    def initialize(word_name = nil, date = nil, part_of_speech = nil, definition= nil, pronounciation = nil)
        @word_name = word_name
        @date = date
        @part_of_speech = part_of_speech
        pronounciation = pronounciation
        @definition = definition
    end

    def self.new_word_of_the_day(hash)
        word = self.new
        word.word_name = hash[:word_name]
        word.date = hash[:date]
        word.part_of_speech = hash[:part_of_speech]
        word.definition = hash[:definition]
        word.pronounciation = hash[:pronounciation]
        @@all << word
        @@words_of_the_day << word
        word
    end

    def self.new_word_from_search(hash)
        word = self.new
        word.word_name = hash[:word_name]
        word.date = hash[:date]
        word.part_of_speech = hash[:part_of_speech]
        word.definition = hash[:definition]
        word.pronounciation = hash[:pronounciation]
        @@all << word
        @@searched_words << word
        word

        # @@all.each do |w|
        #     if w.word_name != hash[:word_name]
        #         word = self.new
        #         word.word_name = hash[:word_name]
        #         word.date = hash[:date]
        #         word.part_of_speech = hash[:part_of_speech]
        #         word.definition = hash[:definition]
        #         word.pronounciation = hash[:pronounciation]
        #         @@all << word
        #         @@searched_words << word
        #         word
        #     else
        #         w
        #     end
        # end
    end

    def self.all
        @@all
    end

    def self.words_of_the_day
        @words_of_the_day
    end

    def self.searched_words
        @searched_words
    end

    def self.todays_word
        @@words_of_the_day.each do |w|
            if w.date == Date.today
                w
            end
        end
    end

    def self.find_a_word(search)
        # @@all.detect {|w_name| w_name == search}
        @@searched_words.each do |w|
            puts w.word_name
            if w.word_name == search || w.word_name === search
                word = w
                return word
            else
                return nil
            end
        end
    end
end
# ---------  TO-DO LIST ---------
# formatting definition ??? (cli)
#  color coding gem ? or diplay as table. 'tty Table gem'

# >> [1,2,3,4,5,6,7].detect { |x| x.between?(3,4) }
# => 3