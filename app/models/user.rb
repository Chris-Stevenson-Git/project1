class User < ApplicationRecord
  #password security
  has_secure_password

  has_many :recipes

end
