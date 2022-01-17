class CreateGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :guides do |t|
      t.string :guide_name
      t.date :on_air
      t.time :begin_at
      t.time :close_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
