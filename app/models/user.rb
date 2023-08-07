require 'devise/jwt'

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :ratings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self


  def jwt_payload
    super
  end
        
end 
