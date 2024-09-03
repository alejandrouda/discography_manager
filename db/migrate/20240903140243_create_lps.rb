class CreateLps < ActiveRecord::Migration[7.0]
  def change
    create_table :lps do |t|
      t.string :name
      t.text :description
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
