class Day4
  attr_reader :password_list

  def initialize(password_list:)
    @password_list = password_list
  end

  def part1
    password_list(validator: DuplicateWordsValidator).count(&:valid?)
  end

  def part2
    password_list(validator: AnagramsValidator).count(&:valid?)
  end

  def password_list(validator:)
    @password_list.map { |string| Password.new(value: string, validator: validator) }
  end
end

class Password
  attr_reader :value, :validator

  def initialize(value:, validator: DuplicateWordsValidator)
    @value = value.chomp
    @validator = validator
  end

  def valid?
    validator.new(password_string: value).valid?
  end
end

class PasswordValidator
  attr_reader :password_string

  def initialize(password_string:)
    @password_string = password_string
  end

  def words
    password_string.split(/\s+/)
  end
end

class DuplicateWordsValidator < PasswordValidator
  def valid?
    words.uniq.length == words.length
  end
end

class AnagramsValidator < PasswordValidator
  def valid?
    DuplicateWordsValidator.new(password_string: with_reduced_anagrams).valid?
  end

  def with_reduced_anagrams
    words.map { |word| word.chars.sort.join }.join(' ')
  end
end
