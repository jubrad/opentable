class RestaurantsController < ApplicationController

# Devise gem - authentication 
before_action :authenticate_owner!

def index
	@restaurants = Restaurant.all
end

def show
	@restaurant = Restaurant.find(params[:id])
end

def new
	@restaurant = current_owner.restaurants.build
end

def edit
	@restaurant = current_owner.restaurants.find(params[:id])
end

def create
	@restaurant = current_owner.restaurants.build(restaurant_params)
	if @restaurant.save
		redirect_to @restaurant, notice: "Restaurant created"
	else
		render action: "new"
	end
end

def update
	@restaurant = current_owner.restaurants.find(params[:id])
	if @restaurant.update_attributes(restaurant_params)
		redirect_to @restaurant, notice: "Restaurant updated"
	else
		render action: "edit"
	end
end

def destroy
	@restaurant = current_owner.restaurants.find(params[:id])
	@restaurant.destroy
	redirect_to restaurants_url, notice: "Restaurant deleted"
end

private
	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address, :phone, :weburl)
	end		

end
