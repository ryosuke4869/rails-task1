class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start
      t.date :fin
      t.boolean :all

      t.timestamps
    end
  end
end