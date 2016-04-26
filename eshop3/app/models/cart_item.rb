class CartItem < ActiveRecord::Base
  # attr_accessible :film_id, :cart_id, :price, :amount

  belongs_to :cart
  belongs_to :film
end
