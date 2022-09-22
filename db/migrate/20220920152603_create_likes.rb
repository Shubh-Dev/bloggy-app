class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :user_id
      t.bigint :post_id
      t.timestamps
    end
  end
end
