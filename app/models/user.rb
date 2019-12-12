class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :sns_crendentials
  has_many :cards

  has_many :addresses
  accepts_nested_attributes_for :addresses
  

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
  

  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :birthday, presence: true
  validates :password, length: {minimum: 7}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,}/i}
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
end
