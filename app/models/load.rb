class Load < ApplicationRecord
  include UserOwned
  belongs_to :caliber
  belongs_to :brass
  belongs_to :bullet
  belongs_to :powder
  belongs_to :primer
end
