class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :video_name
      t.string :media
      t.string :video_url
      t.string :thumbnail
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
