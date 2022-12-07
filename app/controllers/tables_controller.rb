class TablesController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = Table.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = Table.new(table_params)
    @table.restaurant = @restaurant
    if @table.save
      redirect_to restaurant_dashboard_admin_path(@restaurant)
    else
      render "restaurants/#{@restaurant.id}/tables/new", status: :unprocessable_entity
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = Table.find(params[:id])
    @table.update(table_params)
    redirect_to restaurant_dashboard_admin_path(@restaurant)
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    redirect_to restaurant_dashboard_admin_path(@restaurant)
  end

  private

  def table_params
    params.require(:table).permit(:name)
  end
end
