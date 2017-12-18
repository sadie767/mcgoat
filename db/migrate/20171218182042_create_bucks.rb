class CreateBucks < ActiveRecord::Migration[5.1]
  def change
    create_table :bucks do |t|
      t.column :image, :string
      t.column :name, :string
      t.column :price, :decimal

      t.timestamps
    end
  end
end
