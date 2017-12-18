class CreateJuniorsAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :juniors_awards do |t|
      t.column :award, :string
      t.column :junior_id, :integer

      t.timestamps
    end
  end
end
