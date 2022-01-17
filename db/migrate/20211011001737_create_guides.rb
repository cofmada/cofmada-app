class CreateGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :guides do |t|
      t.string :guide_name
      t.string :on_air
      t.string :begin_at
      t.string :close_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
