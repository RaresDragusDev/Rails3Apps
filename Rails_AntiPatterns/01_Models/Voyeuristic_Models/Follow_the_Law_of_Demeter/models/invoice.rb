class Invoice < ActiveRecord::Base
  belongs_to :customer
end

# follow the Law of Demeter
class Invoice < ActiveRecord::Base
  belongs_to :customer

  def customer_name
    customer.name
  end

  def customer_street
    customer.street
  end

  def customer_city
    customer.city
  end

  def customer_state
    customer.state
  end

  def customer_zip_code
    customer.zip_code
  end
end

# using the delegate method
class Invoice < ActiveRecord::Base
  belongs_to :customer

  delegate :name, :street, :city, :state, :zip_code,
           to: :customer,
           prefix: true
end
