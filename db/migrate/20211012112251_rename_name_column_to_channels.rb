class RenameNameColumnToChannels < ActiveRecord::Migration[6.1]
  def change
    rename_column :channels, :name, :channel_name
  end
end
