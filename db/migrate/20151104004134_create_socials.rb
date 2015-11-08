class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.references :user, index: true, foreign_key: true
      t.references :katum, index: true, foreign_key: true
      t.integer :skip
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
