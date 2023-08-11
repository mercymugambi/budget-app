class PaymentsEntity < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :categorisations
  has_many :groups, through: :categorisations
end
