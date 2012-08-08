class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :from_id
      t.integer :to_id
      t.integer :chat_id

      t.timestamps
    end
  end
end
