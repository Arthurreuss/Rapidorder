class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    respond_to do |format|
      if @restaurant.save
        @restaurant.table_names.split.each do |name|
          @table = Table.new({ name: name })
          @table.restaurant = @restaurant
          @table.save
        end
        format.html { redirect_to restaurant_path(@restaurant), notice: "Successfully created Restaurant" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @table_names = restaurant_params[:table_names]
    @restaurant.update(restaurant_params)
    unless @table_names != @restaurant.table_names
      Table.where(restaurant_id: @restaurant.id).each { |t| t.destroy }
      @restaurant.table_names.split.each do |name|
        @table = Table.new({ name: name })
        @table.restaurant = @restaurant
        @table.save
      end
    end
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :table_names)
  end
end
