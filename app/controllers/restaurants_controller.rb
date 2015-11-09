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
	@owner = Owner.find(current_owner.id)
	@restaurant = @owner.restaurants.build
end

def edit
	@owner = Owner.find(current_owner.id)
	@restaurant = Restaurant.find(params[:id])
end

def create
	@owner = Owner.find(current_owner.id)
	@restaurant = @owner.restaurants.create(restaurant_params)
	if @restaurant.save
		redirect_to @restaurant, notice: "Restaurant created"
	else
		render action: "new"
	end
end

def update
	@restaurant = Restaurant.find(params[:id])
	if @restaurant.update_attributes(restaurant_params)
		redirect_to @restaurant, notice: "Restaurant updated"
	else
		render action: "edit"
	end
end

def destroy
	@restaurant = Restaurant.find(params[:id])
	@restaurant.destroy
	redirect_to restaurants_url, notice: "Restaurant deleted"
end

private
	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address, :phone, :weburl)
	end		

end
