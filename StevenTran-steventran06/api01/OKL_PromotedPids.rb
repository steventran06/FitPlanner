require 'json'
require 'CSV'
require 'rest-client'

# This program builds a custom URL to display all products in a specific OKL sale that fit the requirements below.
puts "Easily build a automatic promoted PIDs URL for all products under a certain price and over a minimum quantity"

# Sale ID is the 5 digit number at the end of a sale event URL (ex: https://www.onekingslane.com/sales/51418)
puts "Enter sale event ID to get all available product details:"
event_id = gets.chomp
while event_id.length != 5
	puts "Please enter a proper event ID:"
	event_id = gets.chomp
end

puts "Show all products under what price?"
high_price_limit = gets.chomp

puts "What is the minimum quantity for each product?"
min_quantity = gets.chomp

okl_event_api = JSON.load(RestClient.get("https://www.onekingslane.com/api/sales-events/#{event_id}"))
products = okl_event_api["payload"]["products"]

# All qualified product IDs will fill this array
promoted_pids = []

# Creating a CSV file
CSV.open("Sale #{event_id} PIDs.csv", "wb") do |csv|
	csv << ["Promoted PID URL"]

	# Only add products to the CSV that are available and that are under high_price_limit.
	products.each do |product|
		sale_price = product["price"].gsub("$","").split(".")[0].to_i
		puts sale_price
		# Running filter so we don't have to run product API too often.
		if product["availability"] == "AVAILABLE" && sale_price < high_price_limit.to_i
			# Pulling product ID from event API, to get product details from product API
			product_id = product["product_id"]
			okl_product_api = JSON.load(RestClient.get("https://www.onekingslane.com/api/sales-events/#{event_id}/products/#{product_id}"))
			product_details = okl_product_api["payload"]["skus"]

			product_details.each do |sku|
				if sku["price"] < high_price_limit.to_i && sku["quantity"] > min_quantity.to_i
					promoted_pids.push product_id
				end
			end
		end
	end

	csv << ["Hybrid URL","https://www.onekingslane.com/sales/#{event_id}?promoted_pids=#{promoted_pids.join(",")}&hybrid=true"]
	csv << ["Regular URL","https://www.onekingslane.com/sales/#{event_id}?promoted_pids=#{promoted_pids.join(",")}"]

end

puts "There were #{promoted_pids.length} products that qualified."

