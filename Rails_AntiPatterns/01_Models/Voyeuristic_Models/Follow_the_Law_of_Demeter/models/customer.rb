class Customer < ActiveRecord::Base
  has_one  :address
  has_many :invoices
end

# follow the Law of Demeter
class Customer < ActiveRecord::Base
  has_one  :address
  has_many :invoices

  def street
    address.street
  end

  def city
    address.city
  end

  def state
    address.state
  end

  def zip_code
    address.zip_code
  end
end

# using the delegate method
class Customer < ActiveRecord::Base
  has_one  :address
  has_many :invoices

  delegate :street, :city, :state, :zip_code, to: :address
end
