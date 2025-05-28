class HomeController < ApplicationController
    def add_numbers
        input_numbers = params[:numbers]
        return 0 if input_numbers.nil? || input_numbers.empty?

    sum = input_numbers.split(',').map(&:to_i).sum 
    end