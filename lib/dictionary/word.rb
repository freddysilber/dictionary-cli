class Dictionary::Word
    attr_accessor :word_name, :part_of_speech, :definition, :pronounciation
    # @@all = []
    def self.today
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/word-of-the-day"))
        word_of_the_day = self.new
        word_of_the_day.word_name = doc.css('.word-header .word-and-pronunciation h1').text
        word_of_the_day.part_of_speech = doc.css('.main-attr').text
        word_of_the_day.pronounciation = doc.css('.word-syllables').text
        word_of_the_day.definition = doc.css('.wod-definition-container p')[0].text
        word_of_the_day
    end

    # def word_of_the_day
         
    #     word_of_the_day
    # end

    def self.search_for_word_merriam(word)
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/dictionary/#{word}"))
        search = self.new
        search.word_name = doc.css('.hword')[0].text
        search.part_of_speech = doc.css('.col-lg-12 span')[0].text
        search.definition = doc.css('.dtText').text
        search.pronounciation = doc.css('.pr')[0].text
        search
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