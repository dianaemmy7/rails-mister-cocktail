class AddPhotoUrlToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :photo_url, :string
  end
end
