class User < ActiveRecord::Base
  attr_accessible :username, :password, :confirm_password
    

  before_save :hash_pass

  attr_accessor :password, :confirm_password
  # because password and confirm_password aren't in the database,
  # Activerecord doesn't define any getter/setter methods for them...
  # We need to write them in ourselves.

  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 8}
  validate :password_match

  has_many :posts, foreign_key: :author_id, inverse_of: :author

  scope :ordered, order("username")


  def verify_password(password)
    BCrypt::Password.new.is_password?(password)
  end

  def hash_pass
    self.password_digest = BCrypt::Password.create(@password)
  end

  def password_match
    unless @password == @confirm_password
      errors[:password] = "s don't match"
    end
  end

end
