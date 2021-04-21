class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :training, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :repetitions
      t.time :time

      t.timestamps
    end
  end
end
