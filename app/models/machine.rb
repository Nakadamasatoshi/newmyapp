class Machine < ApplicationRecord
   # Validation
   validates :title, presence: true
   validates :transportation, presence: true

   # ActiveStorage
   #最初は has_one_attached :imageだったけど、画像を複数登録したい場合は has_many_attached :images（複数形s）に変更。他にも変更必要な箇所あり
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
