class Direction < ActiveRecord::Base

  has_many :stops
  belongs_to  :route

end
