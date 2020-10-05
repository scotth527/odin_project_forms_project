class User < ApplicationRecord
    validates :username, :email, :password,
     uniqueness: true,  presence: true,
        length: { minimum: 4 }
     validates :username, length: { maximum: 15 }
     validates :email, format: { with: /\A(.+)@(.+)\z/,
         message: "must be a valid email format"}
     validates_confirmation_of :password
end
