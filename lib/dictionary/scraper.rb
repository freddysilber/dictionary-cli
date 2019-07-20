require_relative 'word.rb'
class Dictionary::Scraper
    def self.get_word_of_day
        # time = Time.now
        # today = time.inspect
        # word_of_the_day = {"test" => "test", 'test' => 'test'}
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
        create_word(word_of_the_day)
        word_of_the_day

    end

    def self.search_for_word(word)
        doc = Nokogiri::HTML(open("https://www.merriam-webster.com/dictionary/#{word}"))
    end

    def self.create_word(hash)
        word = Dictionary::Word.new(hash[:date], hash[:word_name], 
                                    hash[:part_of_speech], hash[:definition],
                                    hash[:pronounciation])
        
        puts word
    end
end