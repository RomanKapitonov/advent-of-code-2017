require 'spec_helper'
require 'day4/day4'

RSpec.describe Day4 do
  let(:input) { File.open('lib/day4/input').each_line }
  subject(:solver) { described_class.new(password_list: input) }

  describe '#part1' do
    it 'calculates' do
      expect(solver.part1).to eq(451)
    end
  end

  describe '#part2' do
    it 'calculates' do
      expect(solver.part2).to eq(223)
    end
  end
end

RSpec.describe Password do
  describe 'valid?' do
    shared_examples 'validate password' do |password_string:, valid:|
      context "password #{password_string}" do
        subject(:password) { described_class.new(value: password_string) }

        it "is #{valid}" do
          expect(password.valid?).to eq(valid)
        end
      end
    end

    {
      "aa bb cc dd ee" => true,
      "aa bb cc dd aa" => false,
      "aa bb cc dd aaa" => true
    }.each do |password_string, valid|
      include_examples 'validate password', password_string: password_string, valid: valid
    end
  end
end

RSpec.describe DuplicateWordsValidator do
  describe 'valid?' do
    shared_examples 'validate' do |password_string:, valid:|
      context "string #{password_string}" do
        subject(:validator) { described_class.new(password_string: password_string) }

        it "is #{valid}" do
          expect(validator.valid?).to eq(valid)
        end
      end
    end

    {
      "aa bb cc dd ee" => true,
      "aa bb cc dd aa" => false,
      "aa bb cc dd aaa" => true
    }.each do |password_string, valid|
      include_examples 'validate', password_string: password_string, valid: valid
    end
  end
end

RSpec.describe AnagramsValidator do
  describe 'valid?' do
    shared_examples 'validate' do |password_string:, valid:|
      context "string #{password_string}" do
        subject(:validator) { described_class.new(password_string: password_string) }

        it "is #{valid}" do
          expect(validator.valid?).to eq(valid)
        end
      end
    end

    {
      "abcde fghij" => true,
      "abcde xyz ecdab" => false,
      "a ab abc abd abf abj" => true,
      "iiii oiii ooii oooi oooo" => true,
      "oiii ioii iioi iiio" => false
    }.each do |password_string, valid|
      include_examples 'validate', password_string: password_string, valid: valid
    end
  end
end
