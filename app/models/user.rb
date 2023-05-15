class User < ApplicationRecord
  has_secure_password :password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :contacts
  has_many :notes
  has_many :tasks

  def self.find_by_credentials(email, password) = find_by(email:)&.authenticate(password)

  def auth_token
    JWT.encode({ id: }, Rails.application.credentials[:jwt_secret], "HS256")
  end

  def self.find_by_jwt(token)
    payload, = JWT.decode(token, Rails.application.credentials[:jwt_secret], true, { algorithm: "HS256" })

    find(payload["id"])
  rescue JWT::DecodeError
    nil
  end
end