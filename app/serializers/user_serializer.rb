class UserSerializer < ActiveModel::Serializer
  attributes :userId, :firstName, :lastName, :clientCode
end
