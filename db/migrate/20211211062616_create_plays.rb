class CreatePlays < ActiveRecord::Migration[6.1]
  def change
    create_table :plays do |t|
      t.integer :start_h
      t.integer :start_m
      t.references :guide, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
