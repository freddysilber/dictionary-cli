class Dictionary::Word
    attr_accessor :date, :word_name, :part_of_speech, :definition, :pronounciation, :word_type
    @@all = []
    # @@words_of_the_day = []
    # @@searched_words = []
    def initialize(word_name = nil, date = nil, part_of_speech = nil, definition= nil, pronounciation = nil, word_type = nil)
        @word_name = word_name
        @date = date
        @part_of_speech = part_of_speech
        @pronounciation = pronounciation
        @definition = definition
        @word_type = word_type
    end
    def self.new_word_of_the_day(hash)
        word = self.new
        word.word_name = hash[:word_name]
        word.date = hash[:date]
        word.part_of_speech = hash[:part_of_speech]
        word.definition = hash[:definition]
        word.pronounciation = hash[:pronounciation]
        @@all << word
        # @@words_of_the_day << word
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
        # @@searched_words << word
        word
    end
    def self.all
        @@all
    end
    def self.words_of_the_day
        @@words_of_the_day
    end
    def self.searched_words
        @@searched_words
    end
    def self.todays_word
        # @@words_of_the_day.detect {|w| w.date == Date.today}
        @@all.detect {|w| w.date == Date.today}
    end
    def self.find_a_word(search)
        # @@all.detect {|w| w.word_name == search}
        @@all.each do |w|
            if w.word_name == search && w.word_type == 'search'
                return w
            end
        end
    end
end