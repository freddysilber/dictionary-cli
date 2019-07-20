class Dictionary::Scraper
    def self.get_word_of_day
        # time = Time.now
        # today = time.inspect
        # word_of_the_day = {"test" => "test", 'test' => 'test'}
        word_of_the_day = {}

        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/word-of-the-day"))
        wordname = doc.css('.word-header .word-and-pronounciation h1').text
        partofspeech = doc.css('.main-attr').text
        pronounciation = doc.css('.word-syllables').text
        definition = doc.css('.wod-definition-container p')[0].text

        word_of_the_day[:word_name] = wordname
        word_of_the_day[:part_of_speech] = partofspeech
        word_of_the_day[:pronounciation] = pronounciation
        word_of_the_day[:definition]= definition
        word_of_the_day
        
    end
end