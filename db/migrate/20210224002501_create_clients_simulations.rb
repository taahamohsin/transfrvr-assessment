class CreateClientsSimulations < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :code

      t.timestamps
    end

    create_table :simulations do |t|
      t.string :name

      t.timestamps
    end

    create_table :clients_simulations do |t|
      t.belongs_to :client
      t.belongs_to :simulation
    end
  end
end
