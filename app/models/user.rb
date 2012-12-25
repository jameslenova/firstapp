class User < ActiveRecord::Base
  attr_accessible :email, :name,:password, :password_confirmation
  has_secure_password
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :chooselocations, dependent: :destroy
  has_many :locations, through: :chooserelationships, source: :location

  has_many :choosesubjects, dependent: :destroy
  has_many :subjects, through: :choosesubjects, source: :subject
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def study?(subject)
    choosesubjects.find_by_subject_id(subject.id)
  end

  def study!(subject)
    choosesubjects.create!(subject_id: subject.id)
  end

  def unstudy!(subject)
    choosesubjects.find_by_subject_id(subject.id).destroy
  end

  def bypass?(location)
    chooselocations.find_by_location_id(location.id)
  end

  def bypass!(location)
    chooselocations.create!(location_id: location.id)
  end

  def unbypass!(location)
    chooselocations.find_by_location_id(location.id).destroy
  end


  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
