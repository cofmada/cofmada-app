class AddBeginAtToGuide < ActiveRecord::Migration[6.1]
  def change
    add_column :guides, :begin_at, :time
    add_column :guides, :close_at, :time
  end
end
