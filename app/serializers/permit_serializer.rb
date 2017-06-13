class PermitSerializer < ActiveModel::Serializer
  attributes :id, :permitName, :permitType, :permitDescription
end
