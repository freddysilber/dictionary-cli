class Dictionary::Word
    attr_accessor :word_name, :part_of_speech, :definition, :pronounciation

    def self.today
        puts "HERE IS THE WORD OF THE DAY"
        puts "we are in the word class now"
        word_1 = self.new
        word_1.word_name = "Button"
        word_1.part_of_speech = "Noun"
        word_1.definition = "A thing you use to push or click."
        word_1.pronounciation = "{!x Bu + ton}"
        word_1
    end
end