class HouseOwnersController < ApplicationController
	before_filter :authenticate_tenant!
  def dashboard
  end
  def show
  end
  
end
