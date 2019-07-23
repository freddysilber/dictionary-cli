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
        puts @@all
    end

    def self.words_of_the_day
        @words_of_the_day
    end

    def self.searched_words
        @searched_words
    end

end


    # def self.today
    #     doc = Nokogiri::HTML(open("https://www.merriam-webster.com/word-of-the-day"))
    #     word_of_the_day = self.new
    #     word_of_the_day.date = Date.today
    #     word_of_the_day.word_name = doc.css('.word-header .word-and-pronunciation h1').text
    #     word_of_the_day.part_of_speech = doc.css('.main-attr').text
    #     word_of_the_day.pronounciation = doc.css('.word-syllables').text
    #     word_of_the_day.definition = doc.css('.wod-definition-container p')[0].text
    #     @@all << word_of_the_day
    #     word_of_the_day
    # end

    # def self.word_of_the_day
    #     @@all
    # end

    # def self.search_for_word_merriam(word)
    #     doc = Nokogiri::HTML(open("https://www.merriam-webster.com/dictionary/#{word}"))
    #     search = self.new
    #     search.word_name = doc.css('.hword')[0].text
    #     search.part_of_speech = doc.css('.col-lg-12 span')[0].text
    #     search.definition = doc.css('.dtText').text
    #     search.pronounciation = doc.css('.pr')[0].text
    #     @@all << search
    #     search
    # end

    # def self.all 
    #     @@all
    # end

    # def self.word_name
    #     @word_name
    # end
# end

# ---------  TO-DO LIST ---------
    # fix error when word is not found
        # better error hanlding

    # formatting definition ??? (cli)

    # break up scraper class and word classes for more object oriented approach

    #  searching the number '0' and numbers ?

    #  color coding gem ? or diplay as table. 'tty Table gem'

# /t --- tab --- /n or \n ? new line ---

#  sunsetter. OBS (screen recording)