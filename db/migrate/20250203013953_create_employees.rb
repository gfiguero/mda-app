class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification_number
      t.string :identification_code
      t.string :identification_type
      t.string :email_address

      t.timestamps
    end
  end
end
