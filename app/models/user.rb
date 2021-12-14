class User < ApplicationRecord
    has_secure_password
    has_many :registrations
    has_many :events, through: :registrations
    validates:firstname, presence:true
    validates:lastname, presence:true
    validates:email, presence:true
    validates:password, presence:true
end
