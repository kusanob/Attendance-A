class CreateBaces < ActiveRecord::Migration[5.1]
  def change
    create_table :baces do |t|
      t.integer :bace_number
      t.string :bace_name
      t.string :bace_type

      t.timestamps
    end
  end
end
