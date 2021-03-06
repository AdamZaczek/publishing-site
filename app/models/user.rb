class User < ActiveRecord::Base
  has_many :posts
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true
end
