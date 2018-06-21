class Receipt < ApplicationMailer
    def receipt(order, cart)
        temp = "Hello #{order.email},\n\n"
        temp += "Order ID: #{order.id}\n\n"
        cart.each do |product_id, details|
            temp += "1 #{Product.find_by(id: product_id).name}\n"
        end
        temp += "\ntotal: #{order.total_cents / 100.0}\n\n" 
        temp += "Thank you for shopping with us.\n\n" 
        temp += "Please come again.\n"
        temp += "\n\nJordan"
        puts temp
    end
end