class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :cart ]

  def cart
  end
end
