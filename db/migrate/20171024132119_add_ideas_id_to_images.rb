class AddIdeasIdToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :ideas_id, :integer
  end
end
