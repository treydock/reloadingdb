module UserOwned
  extend ActiveSupport::Concern

  included do
    belongs_to :user

    scope :by_user, lambda { |user|
      where(user_id: user.id)
    }
  end

end 
