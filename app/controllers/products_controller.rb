class ProductsController < ApplicationController
  include Pagy::Backend

  def index
    @q = params[:q]

    @products = if @q.present?
      Product.search_by_name(@q)
    else
      Product.all
    end

    @pagy, @products = pagy(@products, items: 20)
  end
end
