class Round 
  attr_accessor :deck, 
                :turns, 
                :current_card, 
                :number_correct, 
                :take_turn,    
                :turn_count          
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @turn_count = 0
  end 
  def current_card
    self.deck.cards[self.turns.count]
  end 
  def take_turn(guess)
    new_turn = Turn.new(guess, self.current_card)
    @turn_count += 1
    @turns << new_turn
    if new_turn.correct?
      @number_correct += 1 
    end 
    new_turn
  end
  def number_correct
    @number_correct
  end 
  def number_correct_by_category(correct_category)
    correct_by_category = 0
    self.turns.each do |turn|
      if turn.card.category == correct_category 
        if turn.correct?
          correct_by_category += 1
        end 
      end 
    end 
    correct_by_category
  end 
  def percent_correct
    ((@number_correct.to_f / @turns.count) * 100).to_f.round(2)
  end 
  def percent_correct_by_category(correct_category)
    (((self.number_correct_by_category(correct_category) * 100)) / (self.deck.cards_in_category(correct_category).count)).to_f.round(2)
  end 
end 
