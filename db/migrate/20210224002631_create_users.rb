class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :client_id, null: false
      t.string :first_name
      t.string :last_name
      t.belongs_to :client

      t.timestamps
    end
  end
end
