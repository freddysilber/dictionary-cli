class Dictionary::Word
    attr_accessor :word_name, :part_of_speech, :definition, :pronounciation

    def self.today
        word_of_the_day = self.new
        word_of_the_day.word_name = "Cat"
        word_of_the_day.part_of_speech = "noun, often attributive"
        word_of_the_day.definition = "Definition A: a carnivorous mammal (Felis catus) long domesticated as a pet and for catching rats and mice."
        word_of_the_day
        return word_of_the_day
    end
end