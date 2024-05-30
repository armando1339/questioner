class User < ApplicationRecord
  has_secure_password

  has_many :answers

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  def generate_jwt
    new_jwt = SecureRandom.hex

    update(jwt: new_jwt)

    new_jwt
  end
end
