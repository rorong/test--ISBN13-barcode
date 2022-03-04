# frozen_string_literal: true

# calculate digit of ISBN13
class Barcode
  def initialize
    puts 'Enter Number'
    @user_input = gets
    @input = @user_input.strip
    @input !~ /\D/ ? (puts  "ISBN is:  #{check_digit_isbn13}") : (puts  "Enter Valid Number")
  end

  # check digit of ISBN13
  def check_digit_isbn13
    sum = number_sum
    mod = get_modulo(sum)
    end_number(mod)
  end

  private

  # get modulo of numbers
  def get_modulo(num)
    num.modulo(10)
  end

  # get sum of provided digits
  def number_sum
    sum = 0
    @input.each_char.with_index do |val, index|
      if(index.even?)
        sum += val.to_i
      else
        sum += val.to_i * 3
      end
    end
    sum
  end

  # final result
  def end_number(mod)
    complete_isbn = @input + (10 - mod == 10 ? 0 : 10 - mod).to_s
    complete_isbn.to_i
  end
end

barcode = Barcode.new
