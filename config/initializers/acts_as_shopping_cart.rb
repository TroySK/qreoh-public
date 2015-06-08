module ActiveRecord
  module Acts
    module ShoppingCart
      module Collection
        # Adds a product to the cart
        def add(object, price, details = {}, quantity = 1, cumulative = false)
          shopping_cart_items.create(:item => object, :price => price, :quantity => quantity, :details => details)
        end
      end
    end
  end
end