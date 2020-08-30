class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :image
      t.integer :age
      t.string :certificaton
      t.string :gender
      t.string :strong
      t.string :birthplace
      t.text :text
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
