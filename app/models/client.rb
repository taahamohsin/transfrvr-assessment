class Client < ApplicationRecord
  has_and_belongs_to_many :simulations

  class << self
    def find_all(params)
      clients = Client.where(params)
      clients.map { |client| new(client.attributes) }
    end

    def retrieve_by_id(id)
      client = Client.find(id)
      simulations = client.simulations.map do |simulation|
        Simulation.new(simulation.attributes.symbolize_keys)
      end
      new(**client.attributes.symbolize_keys, simulations: simulations)
    end
  end
end
