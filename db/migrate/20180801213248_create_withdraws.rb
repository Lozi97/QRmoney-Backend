class CreateWithdraws < ActiveRecord::Migration[5.1]
  def change
    create_table :withdraws do |t|
      t.datetime :operation_date
      t.integer :from_hajji_id
      t.integer :to_user_id
      t.float :amount

      t.timestamps
    end
  end
end
