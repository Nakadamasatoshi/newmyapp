class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  #userからprofileを参照できるようにするために追加
  belongs_to :profile
  #ここまで

  #userからmachineを参照できるようにするために追加
  belongs_to :machine
  #ここまで
end