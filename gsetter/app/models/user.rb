# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true

  after_initialize :ensure_session_token

  has_many(
    :goals,
    class_name: :Goal,
    foreign_key: :user_id,
    primary_key: :id
  )
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_valid?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_valid?(password) ? user : nil
  end
end
