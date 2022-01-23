class CreateGuideVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :guide_videos do |t|
      t.integer :start_h
      t.integer :start_m
      t.references :guide, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
    add_index :guide_videos, [:guide_id, :start_h, :start_m], unique: true
  end
end
