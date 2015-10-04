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
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
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

puts "Dealer has: #{dealercards[0]}, #{dealercards[1]} for a total of #{dealertotal}."
puts "You have: #{mycards[0]}, #{mycards[1]} for a total of #{mytotal}."
puts ""
puts "What would you like to do? 1) Hit 2) Stay"
hit_or_stay = gets.chomp



