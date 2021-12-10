class ChangeColumnsToChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :icon, :string
    remove_column :channels, :media, :string
    remove_column :channels, :begin_at, :time
    remove_column :channels, :close_at, :time
  end
end
