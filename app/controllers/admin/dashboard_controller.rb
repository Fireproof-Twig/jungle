class Admin::DashboardController < ApplicationController
  username = ENV["ADMIN_USERNAME"]
  password = ENV["ADMIN_PASSWORD"]
  http_basic_authenticate_with name: "Jungle", password: "book"
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
