class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[cart home]

  def home
    @restaurants = Restaurant.all
  end

  def dashboard_admin
    @restaurant = Restaurant.find(params[:restaurant_id])
    @tables = @restaurant.tables
    generate_qr_codes
    @products = Product.where(restaurant_id: params[:restaurant_id])
  end

  def dashboard_user
    tables = Table.where(restaurant_id: params[:restaurant_id])
    tables = tables.select { |table| table.orders.present? }
    @tables = []
    tables.each do |table|
      if table.orders.all? { |order| order.status == true }
      else
        @tables << table
      end
    end
  end

  def cart
    @products = Product.all
  end

  def generate_qr_codes
    @restaurant = Restaurant.find(params[:restaurant_id])
    @array_qr_codes = []
    @restaurant.tables.each do |table|
      @qr_code = RQRCode::QRCode.new("http://www.rapidorder.org/restaurants/#{@restaurant.id}?table=#{table.name}")
      @svg = @qr_code.as_svg(
        color: "000",
        shape_rendering: "crispEdges",
        module_size: 5,
        standalone: true,
        use_path: true
      )
      @array_qr_codes << @svg
    end
  end

  # def cart
  #   @products = Product.find(params[:ids].split(',')) if params[:ids]
  #   respond_to do |format|
  #     format.html
  #     format.text {
  #       render partial: "shared/shoppingcart_cards", locals: {products: @products}, formats: [:html]
  #     }
  #   end
  # end
    # receives json object.
    # retrieve array of product instances
    # render partial using array

  def update_status
    @order = Order.find(params[:order_id])
    @order.update(status: true)
    redirect_to restaurant_dashboard_user_path
  end
end
