class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
