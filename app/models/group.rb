class Group < ApplicationRecord
  belongs_to :user
  has_many :categorisations
  has_many :payments_entities, through: :categorisations
  has_one_attached :icon

  validates :name, presence: true
end
