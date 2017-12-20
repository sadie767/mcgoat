class CreateDawards < ActiveRecord::Migration[5.1]
  def change
    create_table :dawards do |t|
      t.column :award, :string
      t.column :pedigree, :string
      t.column :doe_id, :integer

      t.timestamps
    end
  end
end
