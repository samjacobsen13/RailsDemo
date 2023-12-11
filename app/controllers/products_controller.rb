require 'json'
require 'net/http'

class ProductsController < ApplicationController
  def index
    if params[:search].present?
      @display_products = fetch_products_from_api(params[:search])
    else
      @display_products = fetch_products_from_api
    end
  end

  private

  def fetch_products_from_api(search = nil)
    url = URI.parse('https://fakestoreapi.com/products')
    response = Net::HTTP.get_response(url)
    products = JSON.parse(response.body)

    if search
      products.select { |product| product['title'].downcase.include?(search.downcase) }
    else
      products
    end
  end
end
