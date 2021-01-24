class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.string :name
      t.text :explanation

      t.timestamps
    end
  end
end
