class Profile < ApplicationRecord
  #Validationを追加
  validates :nickname, presence: true, length: {maximum: 100 }
  validates :familyname, presence: true, length: {maximum: 100 }
  validates :firstname, presence: true, length: {maximum: 100 }
  validates :birthdate, presence: true, length: {maximum: 100 }
  validates :phonenumber, presence: true, length: {maximum: 100 }
  validates :postalcode, presence: true, length: {maximum: 100 }
  validates :address, presence: true, length: {maximum: 100 }
  validates :comment, presence: true, length: {maximum: 100 }
  validates :prefecture, presence: true, length: {maximum: 100 }
  validates :city, presence: true, length: {maximum: 100 }
  validates :town, presence: true, length: {maximum: 100 }
  validates :buildingname, presence: true, length: {maximum: 100 }
  #ここまで
  

  #profileからuserを参照できるようにするために追加。userが削除されたらprofileも削除される。
  has_many :user, dependent: :destroy
  #ここまで
end
