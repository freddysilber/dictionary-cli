require_relative 'scraper.rb'
class Dictionary::Word
    attr_accessor :date, :word_name, :part_of_speech, :definition, :pronounciation
    @@all = []
    @@words_of_the_day = []
    @@searched_words = []

    def self.new_word_of_the_day(hash)
        word = self.new
        word.word_name = hash[:word_name]
        word.date = hash[:date]
        word.part_of_speech = hash[:part_of_speech]
        word.definition = hash[:definition]
        word.pronounciation = hash[:pronounciation]
        @@all << word
        @@words_of_the_day << word
    end

    def self.new_word_from_search(hash)
        @@all.each do |w|
            if w.word_name != hash[:word_name]
                word = self.new
                word.word_name = hash[:word_name]
                word.date = hash[:date]
                word.part_of_speech = hash[:part_of_speech]
                word.definition = hash[:definition]
                word.pronounciation = hash[:pronounciation]
                @@all << word
                @@searched_words << word
            end
        end
    end

    def self.all
        @@all
    end

    def all
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
            # puts w.word_name
            # puts w.date
            if w.date == Date.today
                puts "todays_word ---- "
                puts w.word_name
                return w
            else
                puts "couldnt find word"
                return nil
            end
        end
        # word = new_word_of_the_day({:word_name => "WORD OF THE DAY NAME",
        #                            :date => Date.today,
        #                            :part_of_speech => "NOUN",
        #                            :definition => "DEFINITION OF WORD OF THE DAY",
        #                            :pronounciation => "PRONOUNCIATION"})
        # word

        # puts "hey"
        # @@words_of_the_day.each do |w|
        #     puts w.date
        #     puts w.word_name
        #     puts w.date == Date.today
        #     if w.date != Date.today
        #         w
        #     # else
        #     #     word = Dictionary::Scraper.get_word_of_day
        #     #     self.new_word_of_the_day(word)
        #     #     word
        #     end
        # end
    end
end
# ---------  TO-DO LIST ---------
# formatting definition ??? (cli)
#  color coding gem ? or diplay as table. 'tty Table gem'