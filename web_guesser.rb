require 'sinatra'
require 'sinatra/reloader'


number = rand(100)
get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess, number)
    erb :index, :locals => {:number  => number,
                            :message => message}
end

def check_guess(guess, number)
  if guess > (number + 5)
    message = "Way too high!"
  elsif guess > number
    message = "Too High!"
  elsif guess < (number - 5)
    message = "Way too Low!"
  elsif guess < number
    message = "Too Low!"
  elsif guess == number
    message = "You got it right! The SECRET NUMBER is #{number}"
  end
end
