class User < ApplicationRecord
  #password security
  has_secure_password

  has_many :recipes
  has_many :comments
  has_and_belongs_to_many :shopping_lists


end
