class SearchController < ApplicationController
	def new
		
	end
	def index
		lat = params[:lat].to_f
    	lng = params[:lng].to_f
    	city = params[:city]
    	gender = params[:gender]
    	unless params[:lat].blank?
      		@houses =  House.within(10, :origin => [lat, lng]).where(house_for: gender) 
      		@hash = Gmaps4rails.build_markers(@houses) do |house, marker|
      			marker.infowindow render_to_string(:partial => "house_markerinfo", :locals => { :object => house})
				marker.lat house.latitude
				marker.lng house.longitude
			end
    	else
    		unless params[:gender].blank?
				@houses = House.where(city: city, house_for: gender )
				@hash = Gmaps4rails.build_markers(@houses) do |house, marker|
					marker.infowindow render_to_string(:partial => "house_markerinfo", :locals => { :object => house})
					marker.lat house.latitude
					marker.lng house.longitude
				end
			else
				@houses = House.where(city: city)
				@hash = Gmaps4rails.build_markers(@houses) do |house, marker|
					marker.infowindow render_to_string(:partial => "house_markerinfo", :locals => { :object => house})
					marker.lat house.latitude
					marker.lng house.longitude
				end	
			end	
		end
	end
end
