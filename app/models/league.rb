class League < ActiveRecord::Base
  attr_accessor :password

  has_and_belongs_to_many :users
  has_many :posts

  validates :password, :confirmation => true #password_confirmation attr
  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      @salt = BCrypt::Engine.generate_salt
      p "HELLO SALT"
      self.encrypted_password= BCrypt::Engine.hash_secret(password, @salt)
    end
  end

  def clear_password
    self.password = nil
  end

end
