class TenantsController < ApplicationController
	before_filter :authenticate_tenant!
  def dashboard
  end

end
