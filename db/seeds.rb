require 'json'
require 'net/http'

url = URI.parse('https://fakestoreapi.com/products')
response = Net::HTTP.get_response(url)
products_api = JSON.parse(response.body)

products_api.each do |product|
  existing_product = Product.find_by(title: product['title'])
  next if existing_product

  new_product = Product.create(
    title: product['title'],
    price: product['price'],
    image: product['image'],
    description: product['description']
  )
end




