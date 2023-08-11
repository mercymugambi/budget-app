class Categorisation < ApplicationRecord
  belongs_to :group
  belongs_to :payments_entity
end
