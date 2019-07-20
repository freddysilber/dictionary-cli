require_relative 'scraper.rb'
class Dictionary::Word
    attr_accessor :date, :word_name, :part_of_speech, :definition, :pronounciation
    @@all = []

    def initialize(date = nil, word_name = nil, part_of_speech = nil, definition = nil, pronounciation = nil)
        @date = date
        @word_name = word_name
        @part_of_speech = part_of_speech
        @definition = definition
        @pronounciation = pronounciation
        @@all << self
    end

    def self.today
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/word-of-the-day"))
        word_of_the_day = self.new
        word_of_the_day.date = Date.today
        word_of_the_day.word_name = doc.css('.word-header .word-and-pronunciation h1').text
        word_of_the_day.part_of_speech = doc.css('.main-attr').text
        word_of_the_day.pronounciation = doc.css('.word-syllables').text
        word_of_the_day.definition = doc.css('.wod-definition-container p')[0].text
        @@all << word_of_the_day
        word_of_the_day
    end

    def self.word_of_the_day
        puts "\n test"
        puts Date.today
        puts Dictionary::Scraper.get_word_of_day
        # @@all.each do |word|
        #     if word.date == Date.today
        #         word
        #     else
        #         Dictionary::Scraper.get_word_of_day
        #         word_of_the_day
        #     end
        # end

        # if self.all.date == Date.today
        #     puts "---- #{self.word_name} ---"
        # else
        #     Dictionary::Scraper.get_word_of_day
        #     word_of_the_day
        # end
        # if self.date == Date.today
        #     puts self
        # else
        #     Dictionary::Scraper.get_word_of_day
        # end
    end

    def self.search_for_word_merriam(word)
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/dictionary/#{word}"))
        search = self.new
        search.word_name = doc.css('.hword')[0].text
        search.part_of_speech = doc.css('.col-lg-12 span')[0].text
        search.definition = doc.css('.dtText').text
        search.pronounciation = doc.css('.pr')[0].text
        @@all << search
        search
    end

    def self.all 
        @@all
    end

    def self.word_name
        @word_name
    end
end
# ---------  TO-DO LIST ---------
        # fix error when word is not found
            # better error hanlding

        # formatting definition ??? (cli)

        # break up scraper class and word classes for more object oriented approach

        #  searching the number '0' and numbers ?

        #  color coding gem ? or diplay as table. 'tty Table gem'

# case (var)
#     when var < 0
#         puts "here"
#     break;

# /t --- tab

#  sunsetter. OBS (screen recording)