class CreateHajjis < ActiveRecord::Migration[5.1]
  def change
    create_table :hajjis do |t|
      t.string :first_name
      t.string :last_name
      t.string :nationality
      t.integer :qr
      t.float :balance
      t.integer :bin_code
      t.timestamps
    end
  end
end
