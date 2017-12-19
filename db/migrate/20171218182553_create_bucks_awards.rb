class CreateBucksAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :bucks_awards do |t|
      t.column :award, :string
      t.column :pedigree, :string
      t.column :buck_id, :integer

      t.timestamps
    end
  end
end
