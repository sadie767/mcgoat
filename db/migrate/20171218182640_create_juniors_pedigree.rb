class CreateJuniorsPedigree < ActiveRecord::Migration[5.1]
  def change
    create_table :juniors_pedigrees do |t|
      t.column :pedigree, :string
      t.column :junior_id, :integer

      t.timestamps
    end
  end
end
