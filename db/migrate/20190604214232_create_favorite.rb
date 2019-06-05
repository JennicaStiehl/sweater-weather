class CreateFavorite < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user
      t.string :location
    end
  end
end
