class HomeController < ApplicationController
    def add_numbers
    input_numbers = params[:numbers]
    @result =
      if input_numbers.present?
        begin
          numbers = input_numbers.split(',').map(&:to_i)
          numbers.sum
        rescue ArgumentError
          "Please add comma-separated numbers."
        end
      else
        0
      end
  end
end
    