class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :image
      t.string :name
      t.integer :rate
      t.string :review
      t.integer :user_id
    end
  end
end
