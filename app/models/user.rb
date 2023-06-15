class User < ApplicationRecord
    has_secure_password    
    # https://stackoverflow.com/questions/15514847/how-does-has-secure-password-work-in-my-model-class
    # https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
    validates_uniqueness_of :email
end
