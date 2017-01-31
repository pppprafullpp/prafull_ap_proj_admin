class Influencer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_one :social_account
    has_one :influencer_financial_info

    has_many :advertisements
    scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
    def online
      if self.last_sign_in_at < 5.minutes.from_now
        true
      else
        false
      end
    end

end
