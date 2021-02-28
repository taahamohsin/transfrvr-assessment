class ClientsSimulations < ApplicationRecord
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :simulations

  class << self
    def retrieve_by_id(id)
      User.find(id)
    end

    def get_allowed_simulations(user_id)
      user = User.retrieve_by_id(user_id)
      client = Client.retrieve_by_id(user.client_id)
      client.simulations
    end

    def assign_simulations(client_id, simulation_ids)
      simulation_ids.each do |id|
        ClientsSimulations.create!(
          client_id: client_id,
          simulation_id: id
        )
      end
    end
  end
end
