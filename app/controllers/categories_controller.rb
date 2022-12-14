class CategoriesController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @category = Category.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @category = Category.new(category_params)
    @category.restaurant = @restaurant
    if @category.save
      redirect_to restaurant_dashboard_admin_path(@restaurant)
    else
      render "restaurants/#{@restaurant.id}/categories/new", status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to restaurant_dashboard_admin_path(@restaurant)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :photo, :product_type)
  end
end
