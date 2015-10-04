# Blackjack game

# Pseudo code
# Initialize deck and shuffle
# Deal cards to dealer and player
# Ensure one of the dealer cards is shown and the other card is not
# All of the player's cards are displayed
# Ask the player to hit or stand
# If player hits deal additional card
#   If sum total is greater than 21 then game over
#   Else if less than 21 ask player to hit or stand
#      If hit deal card and recalculate total
#      If stand then display Player stands and transfer play to dealer
#   Otherwise player has 21.  Display player has blackjack message.  Award player.


def calculate_total(cards) # Format for cards array is [["D", "8"], ["H", "Q"], etc...]

  arr = cards.map {|e| e[1]}

  total = 0
  
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K cards
      total += 10
    else
      total += value.to_i
    end
  end
  
  # correct for aces
  arr.select{|e| e == "A"}.count.times do
    if total > 21
      total -= 10
    end
  end
  total
end



puts "Welcome to Blackjack!"

suits = ['H', 'D', 'C', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
deck = suits.product(cards)

deck.shuffle!


# Deal cards
mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)


# Player turn

puts "Dealer has: #{dealercards[0]}, #{dealercards[1]} for a total of #{dealertotal}."
puts "You have: #{mycards[0]}, #{mycards[1]} for a total of #{mytotal}."
puts ""

# Player has 21
if mytotal == 21
  puts "Congratulations! You have blackjack.  You win!"
  exit
end


while mytotal < 21
  puts "What would you like to do? 1) Hit 2) Stay"
  hit_or_stay = gets.chomp

  if !["1", "2"].include?(hit_or_stay)
    puts "Error: You must select either 1 or 2"
    next
  end

  if hit_or_stay == "2"
    puts "You selected to stay."
    break
  end

  #hit
  new_card = deck.pop
  puts "Dealing card to player: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "Your total is now: #{mytotal}"

  if mytotal == 21
    puts "Congratulations! You hit blackjack. You win!"
    exit
  elsif mytotal > 21
    puts "Sorry.  It looks like you busted."
    exit
  end
    
end


# Dealer turn
if dealertotal == 21
  puts "Dealer total is 21. Dealer has blackjack. Dealer wins."
  exit
end

while dealertotal < 17
  # delaer hits
  new_card = deck.pop
  dealercards << new_card
  dealertotal = calculate_total(dealercards)
  puts "Dealer total is now: #{dealertotal}"

  if dealertotal == 21
    puts "Sorry. Dealer total is 21.  Dealer has blackjack. Dealer wins."
    exit
  elsif dealertotal > 21
    puts "Congratulations! Dealer busted. You win!"
    exit
  end
end

# Compaare hands
puts "Dealer Cards:"
dealercards.each do |card|
  puts "=> #{card}"
end
puts ""

puts "Player Cards:"
mycards.each do |card|
  puts "=> #{card}"
end
puts ""

if dealertotal > mytotal
  puts "Sorry.  Dealer wins."
elsif mytotal > dealertotal
  puts "Congratulations! You win!"
else
  puts "It's a tie."
end

exit












