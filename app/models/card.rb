class Card < ApplicationRecord
    has_many :decks
    has_many :users, through: :decks
end
