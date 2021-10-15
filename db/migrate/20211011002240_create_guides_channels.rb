class CreateGuidesChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :guides_channels do |t|
      t.references :guide, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
  add_index :guides_channels, [:guide_id, :channel_id], unique: true
end
