class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :sns_crendentials
  has_many :cards
  has_many :items
  # has_many :images
  # has_many :images, through: :items
  has_many :addresses
  accepts_nested_attributes_for :addresses
  
  has_many :items

  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :birthday, presence: true
  validates :password, length: {minimum: 7}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,}/i}, on: :create
  validates :password, length: {minimum: 7}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,}/i}, on: :update, allow_blank: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
end
