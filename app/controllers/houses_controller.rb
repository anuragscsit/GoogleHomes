  class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
   before_action :auth_owner, except: [:show]
  def auth_owner
    redirect_to  new_house_owner_registration_url unless user_signed_in?
  end
 

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
     @house = House.find(params[:id])
     @visit_schedule=VisitSchedule.new
     @owner_fullname= User.find(@house.house_owner_id).full_name
     @visits = VisitSchedule.group(:house_id).where(house_id: @house.id).count
     @house_owner_image= HouseOwnerProfile.find(@house.house_owner_id).image
     @review = Review.where(house_id: @house.id).all.limit(3)
     
  end

  # GET /houses/new
  def new
    @house = House.new
    @city= City.all
    @house_owner=current_user.id
    @livingroom_amenities = LivingroomAmenitie.all
    @bathroom_amenities = BathroomAmenitie.all
    @bedroom_amenities = BedroomAmenitie.all
    @kitchen_amenities = KitchenAmenitie.all
    @other_amenities = OtherAmenitie.all
  end

  # GET /houses/1/edit
  def edit
    @city= City.all
    @house_owner=current_user.id
    @livingroom_amenities = LivingroomAmenitie.all
    @bathroom_amenities = BathroomAmenitie.all
    @bedroom_amenities = BedroomAmenitie.all
    @kitchen_amenities = KitchenAmenitie.all
    @other_amenities = OtherAmenitie.all
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    @house_owner=current_user.id
    
    @city= City.all
     @livingroom_amenities = LivingroomAmenitie.all
    @bathroom_amenities = BathroomAmenitie.all
    @bedroom_amenities = BedroomAmenitie.all
    @kitchen_amenities = KitchenAmenitie.all
    @other_amenities = OtherAmenitie.all
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def book_house
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:name,:house_type,:house_for,:no_of_rooms,:no_of_beds,:rent_per_room,
                    :rent_per_bed,:food_preference, :city, :location,:latitude, :longitude, :house_owner_id,:distance_from_station, :livingroom_amenities  => [],
                    :bedroom_amenities  => [],:bathroom_amenities  => [],
                    :kitchen_amenities  => [],:other_amenities  => [],:house_image => []
                    )
    end
  
end
