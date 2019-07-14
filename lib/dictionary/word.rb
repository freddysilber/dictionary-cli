class Dictionary::Word
    attr_accessor :word_name, :part_of_speech, :definition, :pronounciation

    def self.today
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/word-of-the-day"))
        word_of_the_day = self.new
        word_of_the_day.word_name = doc.css('.word-header .word-and-pronunciation h1').text
        word_of_the_day.part_of_speech = doc.css('.main-attr').text
        word_of_the_day.pronounciation = doc.css('.word-syllables').text
        word_of_the_day.definition = doc.css('.wod-definition-container p')[0].text
        word_of_the_day
    end

    def self.search_for_word(word)
        # this needs to return a hash of scrapped info from the word looked up
        # scrape page for searched word
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/dictionary/#{word}"))
        search = self.new
        search.word_name = doc.css('.hword')[0].text
        search.part_of_speech = (doc.css('.col-lg-12 span')[0].text) + (doc.css('.col-lg-12 span')[1].text)
        search
        # result = self.new
        # result.word_name = word.to_s.upcase
        # result.part_of_speech = "verb"
        # result.definition = "a random definition here."
        # result

    end
end