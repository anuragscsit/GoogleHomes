class HomeController < ApplicationController
  def index
  end
  def owner
    @owners= HouseOwnerProfile.all.sample(2)
    
  end

  def ghomeshouses
  	@house = House.all
    
  end

  def tenant
    
  end
end
