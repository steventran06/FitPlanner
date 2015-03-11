require 'json'
require 'CSV'
require 'rest-client'
# Program that will export all available products in a One Kings Lane sale with price, quantity, etc.
puts "This program will show all available products under a price you set, and output a CSV"
puts "Enter sale event ID to get all available product details:"
# Sale ID is the 5 digit number at the end of a sale event URL (ex: https://www.onekingslane.com/sales/51418)
event_id = gets.chomp
while event_id.length != 5
	puts "Please enter a proper event ID:"
	event_id = gets.chomp
end

puts "Show all products under what price?"
high_price_limit = gets.chomp

okl_event_api = JSON.load(RestClient.get("https://www.onekingslane.com/api/sales-events/#{event_id}"))

products = okl_event_api["payload"]["products"]
# Creating a CSV file
CSV.open("Sale #{event_id} Details.csv", "wb") do |csv|
	csv << ["Product ID","Product Name","Product Price","Availability","Quantity","URL"]

	# Only add products to the CSV that are available and that are under high_price_limit.
	products.each do |product|
		sale_price = product["price"].gsub("$","").split(".")[0].to_i
		puts sale_price
		# Running filter so we don't have to run product API too often.
		if product["availability"] == "AVAILABLE" && sale_price < high_price_limit.to_i
			# Pulling product ID from event API, to get product details (price, quantity) from product API
			product_id = product["product_id"]
			okl_product_api = JSON.load(RestClient.get("https://www.onekingslane.com/api/sales-events/#{event_id}/products/#{product_id}"))
			product_details = okl_product_api["payload"]["skus"]

			product_details.each do |sku|
				if sku["price"] < high_price_limit.to_i && sku["quantity"] > 0
					# Add Product ID, Product Name, Price, Availability in CSV
					csv << ["#{product["product_id"]}","#{product["title"]}","#{sku["price"]}","#{product["availability"]}","#{sku["quantity"]}","https://www.onekingslane.com/product/#{event_id}/#{product_id}"]
				end
			end
		end
	end
end


