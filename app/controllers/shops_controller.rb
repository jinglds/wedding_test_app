class ShopsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]


  def create
  	@shop = current_user.shops.build(shop_params)
  	if @shop.save
  		flash[:success] = "Shop created!"
  		redirect_to root_url
  	else
  		render'static_pages/home'
  	end
  end

  def destroy
  end

  private
  def shop_params
  	params.require(:shop).permit(:shop_type,
  								:name,
  								:description,
  								:phone,
  								:address,
  								:primary_contact,
  								:details,
                  :email)
  end
end

