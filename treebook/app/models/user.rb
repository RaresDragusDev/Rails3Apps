class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  has_many :statuses

  validates :first_name, :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                             with: /^[a-zA-Z0-9_-]+$/,
                             message: 'Must be formatted correctly.'
                           }

  def full_name
    "#{first_name} #{last_name}"
  end

  def gravatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email.strip.downcase)}"
  end
end
