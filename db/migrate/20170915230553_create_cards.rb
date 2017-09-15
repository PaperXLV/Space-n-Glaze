class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :stripe_customer_token
    end
  end
end
