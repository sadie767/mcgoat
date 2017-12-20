class CreateBawards < ActiveRecord::Migration[5.1]
  def change
    create_table :bawards do |t|
      t.column :award, :string
      t.column :pedigree, :string
      t.column :buck_id, :integer

      t.timestamps
    end
  end
end
