class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

text_split_into_array = @text.downcase.split

    @word_count = text_split_into_array.count

    @character_count_with_spaces = @text.size

text_without_spaces = @text.gsub(/[ ]/,'')

    @character_count_without_spaces = text_without_spaces.size

#.gsub(/[^a-z0-9\s]/i, "") -- come back to this later

    @occurrences = text_split_into_array.count(@special_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

#P = @principal*[(@apr/12)(1 + @apr/12)^@years)]/[(1 + @apr/12)^@years - 1]
#P = B[ (r/12) (1 + r/12)^m) ]/[(1 + r/12)^m - 1]
#Rate times principal,
term1 = (@apr/100)/12
term2 = (1+ (@apr/100)/12)**(@years*12)
term3 = ((1+ (@apr/100)/12)**(@years*12)) - 1


    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = @principal*(term1*term2)/term3

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @days/365

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================



    @sorted_numbers = @numbers.sort

    @count = @sorted_numbers.count

    @minimum = @sorted_numbers.min

    @maximum = @sorted_numbers.max

    @range = @sorted_numbers[@count-1] - @sorted_numbers[0]

if
    @count % 2 == 1
@median = @sorted_numbers[((@count-1)/2)]

else
  @count % 2 == 0
  term_a= @sorted_numbers[(@count/2)-1]
  term_b= @sorted_numbers[((@count)/2)]

@median = (term_b + term_a)/2
    end
    #if even, add two middle terms and divide by two
    #if odd, return middle term-- (@count/2)+1

    @sum = @sorted_numbers.sum

    @mean = @sum/(@count)

    @variance = "Replace this string with your answer."

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
