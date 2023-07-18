class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true
    validates :reenter_password, presence: true, confirmation: { case_sensitive: false }
    validates :user_name, presence: true , uniqueness: true
    # has_many :posts, dependent: :destroy
end
