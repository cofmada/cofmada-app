class AddVideoidToGuide < ActiveRecord::Migration[6.1]
  def change
    add_column :guides, :videoid, :integer
  end
end
