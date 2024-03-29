class Dictionary::Scraper

    @@exception_count = 0
    
    def self.get_word_of_day
        word_of_the_day = {}
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/word-of-the-day"))
        wordname = doc.css('.word-header .word-and-pronunciation h2').text
        partofspeech = doc.css('.main-attr').text
        pronounciation = doc.css('.word-syllables').text
        definition = doc.css('.wod-definition-container p')[0].text
        word_of_the_day[:word_name] = wordname
        word_of_the_day[:part_of_speech] = partofspeech
        word_of_the_day[:pronounciation] = pronounciation
        word_of_the_day[:definition]= definition
        word_of_the_day[:date] = Date.today
        word_of_the_day[:word_type] = "daily"
        word_of_the_day
    end
  
    def self.search_for_word(word)
        word_searched = {}
        begin
            doc = Nokogiri::HTML(open("https://www.merriam-webster.com/dictionary/#{word}"))
            
            wordname = doc.css('.hword')[0].text
            partofspeech = doc.css('.parts-of-speech a')[0].text
            pronounciation = doc.css('.play-pron-v2')[0].text
            word_definition = doc.css('.dtText').text
            definition = word_definition.to_s.gsub("\n", "")
            
            word_searched[:word_name] = wordname
            word_searched[:part_of_speech] = partofspeech
            word_searched[:pronounciation] = pronounciation
            word_searched[:definition] = definition
            word_searched[:word_type] = "search"
        rescue StandardError => e
            word_searched = nil
            # puts e
            @@exception_count += 1
        end
        word_searched
    end
end