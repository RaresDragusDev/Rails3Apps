class User < ActiveRecord::Base
  def self.ordered
    order('last_name')
  end
end

# using scope
class User < ActiveRecord::Base
  scope :ordered, order('last_name')
end
