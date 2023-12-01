require 'net/http'
require 'json'

class ProductsController < ApplicationController
    def index
      if params[:search].present?
        @display_products = Product.filter_by_title(params[:search])
      else
        @display_products = fetch_products_from_api
      end
    end
    private
  
    def fetch_products_from_api
      uri = URI('https://fakestoreapi.com/products')
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end
  end 
