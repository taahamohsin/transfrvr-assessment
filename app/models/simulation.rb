class Simulation < ApplicationRecord
  attr_accessor :simulation_id, :name
  has_and_belongs_to_many :clients

  def initialize(attributes)
    super(attributes)
    @simulation_id = attributes[:id]
    @name = attributes[:name]
  end

  class << self
    def find_all(params)
      data = Simulation.where(params)
      data.map { |simulation| new(simulation.attributes.symbolize_keys) }
    end

    def retrieve_by_id(id)
      simulation = Simulation.find(id)
      new(simulation.attributes.symbolize_keys)
    end
  end
end
