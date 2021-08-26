class User < ActiveRecord::Base
    validates :password, presence: true
    has_many :rides 
end
