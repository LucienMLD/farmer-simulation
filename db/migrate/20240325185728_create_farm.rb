class CreateFarm < ActiveRecord::Migration[7.0]
  def change
    create_table :farms do |t|
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :city, null: false
      t.string :country, null: false, default: "France"

      t.timestamps
    end
  end
end
