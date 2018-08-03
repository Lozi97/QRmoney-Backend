class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :qr
      t.integer :bank_account
      t.float :balance
      t.boolean :admin
      

      t.timestamps
    end
  end
end
