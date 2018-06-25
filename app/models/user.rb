class User < ActiveRecord::Base

    has_secure_password
    has_many :reviews
    validates :name, presence: true
    validates :email, presence: true
    validates :password_confirmation, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 3 }

    def self.authenticate_with_credentials(email, password)
        email = email.strip.downcase
        user = User.find_by(email: email)
        if user && user.authenticate(password)
            @user = user
        else
            nil
        end
    end

end