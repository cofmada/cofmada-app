class CreateGuidesVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :guides_videos do |t|
      t.references :guide, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
    add_index :guides_videos, [:guide_id, :video_id], unique: true
  end
end
