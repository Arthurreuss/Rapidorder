class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @products = Product.all
    @table = params[:table]
    @categories = @restaurant.categories
    @categories_drinks = @categories.select { |category| category.product_type == "Drink" }
    @categories_meals = @categories.select { |category| category.product_type == "Meal" }
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
        @restaurant.category_names.split.each do |name|
          @category = Category.new({ name: name })
          @category.restaurant = @restaurant
          @category.save
        end
        format.html { redirect_to restaurant_dashboard_admin_path(@restaurant), notice: "Successfully created Restaurant" }
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
    unless @category_names != @restaurant.category_names
      Category.where(restaurant_id: @restaurant.id).each { |t| t.destroy }
      @restaurant.category_names.split.each do |name|
        @category = Category.new({ name: name })
        @category.restaurant = @restaurant
        @category.save
      end
    end
    redirect_to restaurant_dashboard_admin_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :table_names, :category_names, :photo)
  end
end
