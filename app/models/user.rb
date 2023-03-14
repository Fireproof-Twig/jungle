class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true, length: { minimum: 5 }
  validates :first_name, presence: true
  validates  :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  before_save do
    self.email.downcase! if self.email
    self.email.strip! if self.email
  end

  def self.authenticate_with_credentials(email, password)
    downcase_email = email.downcase.strip
    user = User.find_by_email(downcase_email)
    if user
      user.authenticate(password)
    else
      nil
    end
  end
end
