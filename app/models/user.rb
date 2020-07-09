class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books,dependent: :destroy
 validates :title, presence: true ,length: { maximum: 200 }
 validates :body, presence: true ,length: { maximum: 200 }
  validates :introduction,  length: { maximum: 75 }

end
