class CreateBucksPedigree < ActiveRecord::Migration[5.1]
  def change
    create_table :bucks_pedigrees do |t|
      t.column :pedigree, :string
      t.column :buck_id, :integer

      t.timestamps
    end
  end
end
