class Group < ApplicationRecord
  belongs_to :user
  has_many :categorisations
  has_many :payments_entities, through: :categorisations
end
