class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :card_count
      t.string :deck_type
      t.string :deck_color
      t.boolean :public
      t.string :format
      t.belongs_to :user
      t.belongs_to :card
      t.timestamps null:false
    end
  end
end
