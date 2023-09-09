class Machine < ApplicationRecord
   # Validation
   validates :title, presence: true
   validates :transportation, presence: true

   # ActiveStorage
   has_one_attached :image

   def self.search(search)
      if search !=""
         Machine.where(['title LIKE(?) OR model LIKE(?) OR price LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
      else
         Machine.includes(:user).order('created_at DESC')
      end
   end
end
