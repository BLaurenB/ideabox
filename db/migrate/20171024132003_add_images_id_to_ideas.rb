class AddImagesIdToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :images_id, :integer
  end
end
