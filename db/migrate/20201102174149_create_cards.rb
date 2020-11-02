class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :effect
      t.string :cost
      t.string :color

      t.timestamps null: false
    end
  end
end
