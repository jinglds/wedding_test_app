class StaticPagesController < ApplicationController
  def home
    @shop = current_user.shops.build if signed_in?
    @event = current_user.events.build if signed_in?
  end

  def help
  end

  def vendors
    if signed_in?
      @vendor_feed_items = Shop.all.paginate(page: params[:page])
    end
  end

  def events
  end

  def account
  	
  end
end
