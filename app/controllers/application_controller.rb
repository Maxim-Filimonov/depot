class ApplicationController < ActionController::Base
  protect_from_forgery
  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    def inc_index_page_counter
      if session[:counter].nil?
        session[:counter] = 1
      else
        session[:counter] += 1
      end
    end
    def reset_index_page_counter
      session[:counter] = nil
    end
end
