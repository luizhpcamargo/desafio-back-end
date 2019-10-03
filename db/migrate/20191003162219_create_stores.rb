class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :owner
      t.string :name

      t.timestamps
    end
  end
end
