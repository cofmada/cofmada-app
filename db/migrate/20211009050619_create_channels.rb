class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :channel_name
      t.string :channel_url
      t.string :icon
      t.string :search_key
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
