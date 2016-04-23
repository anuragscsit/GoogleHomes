class HomeController < ApplicationController
  def index
  end
  def owner
  end
  def map
  	
  end

  def ghomeshouses
  	@house = House.all
    
  end
end
