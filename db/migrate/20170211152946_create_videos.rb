class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string  :title
      t.string  :watermark
      t.integer :width
      t.integer :height
      t.integer :duration
      t.string  :file
      t.boolean :success

      # t.timestamps null: false
    end
  end
end
