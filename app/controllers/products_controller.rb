class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[meals drinks]


  def drinks
    @table = params[:table]
    @restaurant = Restaurant.find(params[:restaurant_id])
    @categories = Category.where(product_type: 'Drink').select { |category| category.restaurant == @restaurant }
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
    end
    # @drinks = @categories.products
    # respond_to do |format|
    #   format.html
    #   format.text { render partial: "products/productcard_drinks", locals: {drinks: @drinks}, formats: [:html] }
    # end
  end

  def meals
    @table = params[:table]
    @restaurant = Restaurant.find(params[:restaurant_id])
    @categories = Category.where(product_type: 'Meal').select { |category| category.restaurant == @restaurant }
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
    end
    @meals = Product.all.where(product_type: 'Meal')
    @allergies = Allergy.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = Product.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = Product.new(product_params)
    @product.restaurant = @restaurant
    product_params[:allergy_ids].reject { |id| id == "" }.each do
      @product_allergy = ProductAllergy.new
      @product_allergy.product = @product
      @product_allergy.save
    end
    respond_to do |format|
      if @product.save
        redirect_to restaurant_dashboard_admin_path(@restaurant)
      else
        render "restaurants/#{@restaurant.id}/products/new", status: :unprocessable_entity
      end
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = Product.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to restaurant_dashboard_admin_path(@restaurant)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to restaurant_dashboard_admin_path(@restaurant)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :allergies, :category_id, :photo, :product_type, allergy_ids: [])
  end
end
