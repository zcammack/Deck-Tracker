class AddCreatureAttributesToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :type, :string
    add_column :cards, :attack_value, :integer
    add_column :cards, :health_value, :integer
  end
end
