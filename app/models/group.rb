class Group < ApplicationRecord
  belongs_to :user
  has_many :categorisations
  has_many :payments_entities, through: :categorisations
  attribute :icon, :string, default: 'image upload'
  has_one_attached :icon
  validates :name, :icon, presence: true
end
