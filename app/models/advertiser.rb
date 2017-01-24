class Advertiser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
     has_many :advertisements

    scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }

  def self.reset_password
  end

end
