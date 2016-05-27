class VisitSchedulesController < ApplicationController
  before_action :set_visit_schedule, only: [:show, :edit, :update, :destroy]

  # GET /visit_schedules
  # GET /visit_schedules.json
  def index
    @visit_schedules = VisitSchedule.all
  end

  # GET /visit_schedules/1
  # GET /visit_schedules/1.json
  def show
  end

  # GET /visit_schedules/new
  def new
    @visit_schedule = VisitSchedule.new
    @house = House.find(params[:id])

  end

  # GET /visit_schedules/1/edit
  def edit
  end

  # POST /visit_schedules
  # POST /visit_schedules.json
  def create
    @visit_schedule = VisitSchedule.new(visit_schedule_params)
   
    respond_to do |format|
      if @visit_schedule.save
        format.html { redirect_to :back, notice: 'Visit schedule was successfully created.' }
        format.json { render :show, status: :created, location: @visit_schedule }
      else
        format.html { render :new }
        format.json { render json: @visit_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visit_schedules/1
  # PATCH/PUT /visit_schedules/1.json
  # def update
  #   respond_to do |format|
  #     if @visit_schedule.update(visit_schedule_params)
  #       format.html { redirect_to :back, notice: 'Visit schedule was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @visit_schedule }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @visit_schedule.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /visit_schedules/1
  # DELETE /visit_schedules/1.json
  # def destroy
  #   @visit_schedule.destroy
  #   respond_to do |format|
  #     format.html { redirect_to visit_schedules_url, notice: 'Visit schedule was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit_schedule
      @visit_schedule = VisitSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_schedule_params
      params.require(:visit_schedule).permit(:name, :email, :phone, :date, :time,:house_owner_id,:house_id)
    end
end
