class CreatePlayVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :play_videos do |t|
      t.references :play, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
    add_index :play_videos, [:play_id, :video_id], unique: true
  end
end
