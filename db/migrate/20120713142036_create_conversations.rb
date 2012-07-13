class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
