class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :media
      t.date :on_air
      t.time :begin_at
      t.time :close_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
