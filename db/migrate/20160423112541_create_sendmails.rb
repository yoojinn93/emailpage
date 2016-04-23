class CreateSendmails < ActiveRecord::Migration
  def change
    create_table :sendmails do |t|
      
      t.string "emailto"
      t.string "title"
      t.string "content"

      t.timestamps null: false
    end
  end
end
