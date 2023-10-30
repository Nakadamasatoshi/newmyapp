class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  #userからprofileを参照できるようにするために追加。一つしか持てないのでhas_one
  # userを削除した時に、関連するprofileも消す必要があるので、dependent: :destroyが必要。machineも同義
  has_one :profile, dependent: :destroy
  #ここまで

  #userからmachineを参照できるようにするために追加。machineは複数あるので、複数形sをつける
  #userは多数のmachineを持てるのでhas_many
  has_many :machines, dependent: :destroy
  #ここまで

  #個人情報登録用の画像をuserに保存する。本人画像と運転免許証の画像は分けておく。
  has_one_attached :personal_image, dependent: :destroy
  has_one_attached :license_image, dependent: :destroy
  #ここまで
end