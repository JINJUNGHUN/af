class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :temperature
      t.integer :time

      t.timestamps
    end
  end
end
