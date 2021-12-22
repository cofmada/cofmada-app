class AddChUrlToChannel < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :ch_url, :string
  end
end
