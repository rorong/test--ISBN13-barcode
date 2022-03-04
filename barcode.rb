# frozen_string_literal: true

# calculate digit of ISBN13
class Barcode
  def initialize
    puts 'Enter Number'
    @input = gets
    puts  "ISBN is:  #{check_digit_isbn13}"
  end

  # check digit of ISBN13
  def check_digit_isbn13
    sum = get_array_sum
    mod = get_modulo(sum)
    end_number(mod)
  end

  private

  # get modulo of numbers
  def get_modulo(num)
    num.modulo(10)
  end

  # get sum of provided digits
  def get_array_sum
    first_array = @input.to_s.each_char.map(&:to_i).each_slice(2).map(&:first).sum
    second_array = @input.to_s.each_char.map(&:to_i).each_slice(2).map(&:last).sum * 3
    first_array + second_array
  end

  # final result
  def end_number(mod)
    complete_isbn = @input.strip + (10 - mod == 10 ? 0 : 10 - mod).to_s
    complete_isbn.to_i
  end
end

barcode = Barcode.new
