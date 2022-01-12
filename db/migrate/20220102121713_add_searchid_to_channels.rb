class AddSearchidToChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :searchid, :string
  end
end
