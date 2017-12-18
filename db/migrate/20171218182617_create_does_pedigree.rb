class CreateDoesPedigree < ActiveRecord::Migration[5.1]
  def change
    create_table :does_pedigrees do |t|
      t.column :pedigree, :string
      t.column :doe_id, :integer

      t.timestamps
    end
  end
end
