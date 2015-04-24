class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true

  before_validation :ensure_session_token

  has_many(
    :notes,
    class_name: :Note,
    foreign_key: :user_id,
    primary_key: :id
  )

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return nil if user.nil?
    BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
  end

end
