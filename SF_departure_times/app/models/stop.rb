class Stop < ActiveRecord::Base

  belongs_to  :direction
  delegate  :route, to: :direction
end
