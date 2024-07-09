class User < ApplicationRecord
    has_secure_password
    # before_create :generate_auth_token

    validates :email, presence:true, uniqueness:true, format:{with: URI::MailTo::EMAIL_REGEXP}
    validates :password, presence:true, length: {in: 6..10}

    private
    def generate_auth_token
        self.auth_token=SecureRandom.hex
    end
end
