require 'pry'
require 'sinatra'
require 'sinatra/reloader'

@@number = rand(0..100)

  get '/' do
    guess = params["guess"].to_i
    cheat = params["cheat"]
    output = check_guess(guess, cheat)
    erb :index, :locals => {:number => @@number, :guess => guess, :output => output, :cheat => cheat}
  end

  def check_guess(guess, cheat)
    @@guess_counter += 1
    if guess < @@number
      too_low(guess)
    elsif guess > @@number
      too_high(guess)
    else guess == @@number
      generate_guess
      "You got the secret number! Guess again to play again."
    end
  end

  def generate_guess
    @@number = rand(0..100)
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
