class Dictionary::Word
    attr_accessor :word_name, :part_of_speech, :definition, :pronounciation

    def self.today
        word_of_the_day = self.new
        word_of_the_day.word_name = "Cat"
        word_of_the_day.part_of_speech = "noun, often attributive"
        word_of_the_day.definition = "a carnivorous mammal (Felis catus) long domesticated as a pet and for catching rats and mice."
        word_of_the_day
        return word_of_the_day
    end

    def self.search_for_word(word)
        # this needs to return a hash of scrapped info from the word looked up
        result = self.new
        result.word_name = word.to_s
        word

    end
end