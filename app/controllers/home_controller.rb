class HomeController < ApplicationController
    def add_numbers
    input_numbers = params[:numbers]
    @result =
      if input_numbers.present?
        begin
            input_numbers = input_numbers.gsub("\\n", "\n")
            numbers = input_numbers.scan(/-?\d+/).map(&:to_i)
            negative = numbers.select { |n| n < 0 }
            if negative.any?
                raise ArgumentError, "Negative numbers not allowed: #{negative.join(', ')}"
            end
            numbers.sum
        rescue ArgumentError => e
            e.message
        end
      else
        0
      end
  end
end
    