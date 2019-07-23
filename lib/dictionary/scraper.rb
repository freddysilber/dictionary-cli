require_relative 'word.rb'

class Dictionary::Scraper

    def self.get_word_of_day
        word_of_the_day = {}
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/word-of-the-day"))
        wordname = doc.css('.word-header .word-and-pronunciation h1').text
        partofspeech = doc.css('.main-attr').text
        pronounciation = doc.css('.word-syllables').text
        definition = doc.css('.wod-definition-container p')[0].text
        word_of_the_day[:word_name] = wordname
        word_of_the_day[:part_of_speech] = partofspeech
        word_of_the_day[:pronounciation] = pronounciation
        word_of_the_day[:definition]= definition
        word_of_the_day[:date] = Date.today
        word_of_the_day
    end

    def self.search_for_word(word)
        word_searched = {}
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/dictionary/#{word}"))
        # begin
        #     doc = Nokogiri::HTML(open("https://www.merriam-webster.com/dictionary/#{word}"))
        # rescue StandardError=>e
        #     puts "Error! #{e}"
        #     puts "Could not find that word. Please try a diffeferent one :)"
        #     return nil
        # else
        #     puts "the word you entered was #{word}"
        #     return nil
        # end
        
        begin
            wordname = doc.css('.hword')[0].text
            partofspeech = doc.css('.col-lg-12 span')[0].text
            pronounciation = doc.css('.pr')[0].text
            definition = doc.css('.dtText').text
        rescue StandardError => e
            puts e.message
        else
            puts "Sorry what was that?"
        end




        # wordname = doc.css('.hword')[0].text
        # partofspeech = doc.css('.col-lg-12 span')[0].text
        # pronounciation = doc.css('.pr')[0].text
        # definition = doc.css('.dtText').text
        word_searched[:word_name] = wordname
        word_searched[:part_of_speech] = partofspeech
        word_searched[:pronounciation] = pronounciation
        word_searched[:definition] = definition
        word_searched
    end

end