class FridgeSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :foods

  attributes :type, :last_check_date
end
