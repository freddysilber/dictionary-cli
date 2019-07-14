class Dictionary::Word
    attr_accessor :word_name, :part_of_speech, :definition, :pronounciation

    def self.today
        # scrape homepage for word of the day
        # word_of_the_day = self.new
        # word_of_the_day.word_name = "Cat"
        # word_of_the_day.part_of_speech = "noun, often attributive"
        # word_of_the_day.definition = "a carnivorous mammal (Felis catus) long domesticated as a pet and for catching rats and mice."
        # word_of_the_day
        self.scrape_homepage
    end

    def self.search_for_word(word)
        # this needs to return a hash of scrapped info from the word looked up
        # scrape page for searched word
        result = self.new
        result.word_name = word.to_s.upcase
        result.part_of_speech = "verb"
        result.definition = "a random definition here."
        result

    end

    def self.scrape_homepage
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com"))
        word_of_the_day = self.new
        word_of_the_day.word_name = doc.css('.wh-word-and-pron .wh-word a').text
        word_of_the_day.part_of_speech = "____"
        word_of_the_day.definition = doc.css('.wh-def-text').text
        word_of_the_day
        
        # puts "--- #{word_of_the_day}"
    end
end