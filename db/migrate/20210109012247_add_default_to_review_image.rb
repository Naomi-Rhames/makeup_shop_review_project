class AddDefaultToReviewImage < ActiveRecord::Migration
  def change
    change_column_default :reviews, :image, "https://pbs.twimg.com/profile_images/1146063208760795137/LZva9jZf_400x400.jpg"

  end
end
