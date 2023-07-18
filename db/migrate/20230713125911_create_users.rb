class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password
      t.string :reenter_password

      t.timestamps
    end
  end
end