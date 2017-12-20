class CreateJawards < ActiveRecord::Migration[5.1]
  def change
    create_table :jawards do |t|
      t.column :award, :string
      t.column :pedigree, :string
      t.column :junior_id, :integer

      t.timestamps
    end
  end
end
