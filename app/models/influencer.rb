class Influencer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_one :social_account
    has_many :advertisements

    def online
      if self.last_sign_in_at < 5.minutes.from_now
        true
      else
        false
      end
    end

end
