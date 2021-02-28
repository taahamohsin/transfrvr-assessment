class User < ApplicationRecord
  attr_accessor :userId, :firstName, :lastName, :clientId, :clientCode
  belongs_to :client

  class << self
    def find_all(params)
      users = User.where(params)
      users.map do |user|
        client = user.client
        attributes = {
          userId: user.id,
          firstName: user.first_name,
          lastName: user.last_name,
          clientId: client[:id],
          clientCode: client[:code]
        }
        new(attributes)
      end
    end

    def retrieve_by_id(id)
      user = User.find(id)
      client = user.client
      attributes = {
        userId: user.id,
        firstName: user.first_name,
        lastName: user.last_name,
        clientId: client[:id],
        clientCode: client[:code]
      }
      new(attributes)
    end

    def get_allowed_simulations(user_id)
      user = User.find(user_id)
      user.client.simulations.map { |simulation| Simulation.new(simulation.attributes.symbolize_keys) }
    end
  end
end
