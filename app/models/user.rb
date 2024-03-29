class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nama,  presence: true, length: { maximum: 15 }
  has_one :profil, dependent: :destroy
  accepts_nested_attributes_for :profil
  has_many :lamarans, dependent: :destroy
  accepts_nested_attributes_for :lamarans
end
