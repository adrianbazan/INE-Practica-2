class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :film

  def validate
    errors.add(:amount, "debería ser uno o más") unless amount.nil? || amount > 0
    errors.add(:price, "debería ser un número positivo") unless price.nil? || price > 0.0
  end
end
