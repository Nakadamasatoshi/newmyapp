class Machine < ApplicationRecord
   # Validation
   validates :title, presence: true
   validates :transportation, presence: true

   # ActiveStorage
   has_one_attached :image
end
