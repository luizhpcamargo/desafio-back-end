class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :type
      t.datetime :event_time
      t.decimal :value
      t.string :document
      t.string :card
      t.references :store

      t.timestamps
    end
  end
end
