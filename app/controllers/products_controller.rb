class ProductsController < ApplicationController
  def drinks
    @category = params[:category]
    @drinks = Product.all.where(product_type: 'Drink')

    respond_to do |format|
      format.html
      format.text { render partial: "products/productcard_drinks", locals: {drinks: @drinks}, formats: [:html] }
    end
  end

  def meals
    @meal = Product.all.first
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
        format.html { redirect_to restaurant_restaurant_drinks_path, notice: "Successfully created Product" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to dashboard_admin_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :allergies, :category, :photo, :product_type, allergy_ids: [])
  end
end
