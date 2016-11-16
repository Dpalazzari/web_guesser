require 'pry'
require 'sinatra'
require 'sinatra/reloader'

@@number = rand(0..100)
@@guess_counter = 0
  get '/' do
    guess = params["guess"].to_i
    output = check_guess(guess)
    erb :index, :locals => {:number => @@number, :guess => guess, :output => output, :guess_counter => @@guess_counter}
  end

  def check_guess(guess)
    @@guess_counter += 1
    if guess < @@number
      too_low(guess)
    elsif guess > @@number
      too_high(guess)
    else guess == @@number
      "You got the secret number! Guess again to play again."
    end
  end

  def too_low(guess)
    if guess < (@@number - 5)
      "Way too low!"
    else
      "Too low!"
    end
  end

  def too_high(guess)
    if guess > (@@number + 5)
      "Way too high!"
    else
      "Too high!"
    end
  end
