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

   #machineからuserを参照できるようにするために追加、
   # machineが削除された時にuserを削除してはいけないのでdependent: :destroyは不要。profileも同じ
   # machineが複数のユーザーを持ってはいけないのでbelong_toにする
   belongs_to :user
   #ここまで

   has_one :profile
end
