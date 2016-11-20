class User < ApplicationRecord

  validates :email, presence: true, 
                    uniqueness: true,
                    length: { minimum: 5, maximum: 200, too_long: "%{count} characters is the maximum allowed", too_short: "%{count} characters is the minimum allowed" }
  validates :password, presence: true,
                    length: { minimum: 4, maximum: 20, too_long: "%{count} characters is the maximum allowed", too_short: "%{count} characters is the minimum allowed" }

end
