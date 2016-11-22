class UsersController < ApplicationController
  def index
    @users = User.order('last_name')
  end
end

# using find in the model
class UsersController < ApplicationController
  def index
    @users = User.ordered
  end
end
