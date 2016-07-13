class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  validates :username, presence: true, length: {maximum 75}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :email, presence: true,
                    length: {maximum:255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\d\-]+)+\z/i},
                    uniqueness: {case_sensitive: false}
  
  before_save :downcase_email
  has_secure_password



  private


   def downcase_email 
    self.email == email.downcase
   end


end
