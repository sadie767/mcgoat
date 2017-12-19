class CreateDoesAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :does_awards do |t|
      t.column :award, :string
      t.column :pedigree, :string
      t.column :doe_id, :integer

      t.timestamps
    end
  end
end
