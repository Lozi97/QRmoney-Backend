class CreateDeposits < ActiveRecord::Migration[5.1]
  def change
    create_table :deposits do |t|
      t.datetime :operation_date
      t.integer :from_user_id
      t.integer :to_hajji_id
      t.float :amount

      t.timestamps
    end
  end
end
