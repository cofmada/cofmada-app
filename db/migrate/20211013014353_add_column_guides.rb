class AddColumnGuides < ActiveRecord::Migration[6.1]
  def change
    add_column :guides, :on_air, :date
  end
end
