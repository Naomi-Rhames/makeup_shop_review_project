class CreateMakeup < ActiveRecord::Migration
  def change
    create_table :makeups do |t|
      t.string :name
      t.string :colors
      t.string :price
      t.string :model
      t.string :image
    end
  end
end





