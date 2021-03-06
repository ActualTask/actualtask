class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  include PublicActivity::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable


  has_many :dispute_users
  has_many :disputes, through: :dispute_users
  has_many :messages
  has_many :reviews
  has_many :achievements
  has_many :posts
  has_many :tasks
  has_one :performer
  has_one :info
  has_many :response_lists, class_name: 'ResponseList', primary_key: 'id', foreign_key: 'performer_id'
  has_many :jobs, class_name: "Task", foreign_key: "performer_id"
  has_many :responded_tasks, :through => :response_lists, :source => :task, foreign_key: 'performer_id'
  has_many :activities

  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
  end


  def name
    email.split('@')[0]
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

 

end
