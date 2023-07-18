class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true
    validates :reenter_password, presence: true, confirmation: { case_sensitive: false }
    validate :password_match_validation
    validates :user_name, presence: true , uniqueness: true
    def password_match_validation
        if password.present? && reenter_password.present? && password != reenter_password
            errors.add(:reenter_password, "must match the password")
        end
    end
    # has_many :posts, dependent: :destroy
end
