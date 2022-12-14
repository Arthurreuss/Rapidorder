class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home cart checkout render_confirmation confirmation render_cart]

  def home
    if current_user.present?
      @restaurants = Restaurant.where(user_id: current_user.id)
    end
  end

  def cart
  end

  def checkout
  end

  def dashboard_admin
    @restaurants = Restaurant.where(user_id: current_user.id)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @tables = @restaurant.tables
    generate_qr_codes
    @products = Product.where(restaurant_id: params[:restaurant_id])
    @categories = Category.where(restaurant_id: params[:restaurant_id])
  end

  def dashboard_user
    @restaurants = Restaurant.where(user_id: current_user.id)
    @restaurant = Restaurant.find(params[:restaurant_id])
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

  def confirmation
    cart = params['_json']

    cart.each do |order|
      @product = Product.find(order[:id])
      table = Table.where(name: order[:table]).first
      order = Order.new(amount: order[:amount])
      order.table = table
      order.product = @product
      order.save!
    end

    cart.map! do |order|
      { product: Product.find(order[:id]),
        amount: order[:amount],
        price: order[:price],
        table: order[:table]
      }
    end

    respond_to do |format|
      format.text {
        render partial: "shared/confirmation_cards", locals: {cart: cart}, formats: [:html]
      }
    end
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

  def cart
    @products = Product.all
  end

  def render_cart
    cart = params['_json']

    cart.map! do |order|
      { product: Product.find(order[:id]),
        amount: order[:amount],
        price: order[:price]
      }
    end
    respond_to do |format|
      format.text {
        render partial: "shared/shoppingcart_cards", locals: {cart: cart}, formats: [:html]
      }
    end
  end

  def update_status
    @order = Order.find(params[:order_id])
    @order.update(status: true)
    head :ok;
    # redirect_to restaurant_dashboard_user_path
  end
end
