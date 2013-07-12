class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :theme
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
