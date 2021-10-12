class RenameNameColumnToGuides < ActiveRecord::Migration[6.1]
  def change
    rename_column :guides, :name, :guide_name
  end
end
