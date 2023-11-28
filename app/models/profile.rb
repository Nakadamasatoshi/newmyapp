class Profile < ApplicationRecord
  #Validationを追加
  validates :nickname, presence: true, length: {maximum: 100 }
  validates :familyname, presence: true, length: {maximum: 100 }
  validates :firstname, presence: true, length: {maximum: 100 }
  validates :birthdate, presence: true
  validates :phonenumber, presence: true
  validates :postalcode, presence: true, length: {maximum: 100 }
  validates :comment, presence: true, length: {maximum: 100 }
  validates :prefecture, presence: true, length: {maximum: 100 }
  validates :city, presence: true, length: {maximum: 100 }
  validates :town, presence: true, length: {maximum: 100 }
  validates :buildingname, length: {maximum: 100 }
  #ここまで
  

  #profileからuserを参照できるようにするために追加。userが削除されたらprofileも削除される。
  belongs_to :user, dependent: :destroy
  #ここまで

  #個人情報登録用の画像をuserに保存する。本人画像と運転免許証の画像は分けておく。（元々はuserにつけていたが、profileに持ってきた）
  has_one_attached :personal_image, dependent: :destroy
  has_one_attached :license_image, dependent: :destroy
  #ここまで
end
