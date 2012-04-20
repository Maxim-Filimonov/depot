class StoreController < ApplicationController
  def index
    @times_accessed = inc_index_page_counter 
    @products = Product.order(:title)
  end
end
