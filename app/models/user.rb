class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :lockable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable
end
