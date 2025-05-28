class HomeController < ApplicationController
    def add_numbers
    input_numbers = params[:numbers]
    @result =
      if input_numbers.present?
        begin
            input_numbers = input_numbers.gsub("\\n", "\n")
            numbers = input_numbers.split(/\D+/).map(&:strip).reject(&:empty?).map(&:to_i)
            numbers.sum
        rescue ArgumentError
            "Please add comma-separated numbers."
        end
      else
        0
      end
  end
end
    