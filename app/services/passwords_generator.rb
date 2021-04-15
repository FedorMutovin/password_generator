# frozen_string_literal: true

class PasswordsGenerator
  attr_reader :length

  def initialize(length)
    @length = length.to_i
  end

  ALPHABET = ('a'..'z').to_a.freeze
  NUMBERS = (0..9).to_a.freeze
  NUMBERS_PRESENCE_COUNT = 2

  def call
    generate_password
  end

  private

  def generate_password
    password = []
    (1..length - NUMBERS_PRESENCE_COUNT).each do |number|
      password << if number.even?
                    vowels.sample
                  else
                    consonants.sample
                  end
    end
    NUMBERS_PRESENCE_COUNT.times { password << NUMBERS.sample }
    password.join
  end

  def vowels
    @vowels ||= ALPHABET.select { |letter| %w[a e i o u].include?(letter) }
  end

  def consonants
    @consonants ||= ALPHABET - vowels
  end
end
