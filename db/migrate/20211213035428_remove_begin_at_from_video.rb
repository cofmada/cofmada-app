class RemoveBeginAtFromVideo < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :begin_at, :time
    remove_column :videos, :close_at, :time
  end
end
