# Blackjack game

# Pseudo code
# Initialize deck
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


puts "Welcome to Blackjack!"

suits = ['H', 'D', 'C', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
deck = suits.product(cards)



deck.shuffle!

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

puts "My cards: #{mycards.to_s}"
puts "Dealer cards: #{dealercards.to_s}"

