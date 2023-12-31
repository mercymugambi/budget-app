class User < ApplicationRecord
  has_many :payments_entity, foreign_key: 'author_id'
  has_many :groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :password, presence: true
end
