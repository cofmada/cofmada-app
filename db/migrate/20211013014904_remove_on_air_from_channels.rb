class RemoveOnAirFromChannels < ActiveRecord::Migration[6.1]
  def change
    remove_column :channels, :on_air, :date
  end
end
