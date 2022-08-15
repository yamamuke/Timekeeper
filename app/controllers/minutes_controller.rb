class MinutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minute, only: [:show, :edit, :update, :destroy]

  # GET /minutes
  def index
    @minutes = current_user.minutes.all
  end

  # GET /minutes/1
  # def show
  # end

  # GET /minutes/new
  def new
    @minute = current_user.minutes.new
  end

  # GET /minutes/1/edit
  def edit
  end

  # POST /minutes
  def create
    @minute = current_user.minutes.new(minute_params)

    if @minute.save
      #redirect_to @minute, notice: 'Minute was successfully created.'
      @status = true
    else
      #render :new
      @status = false
    end
  end

  # PATCH/PUT /minutes/1
  def update
    if @minute.update(minute_params)
      #redirect_to @minute, notice: 'Minute was successfully updated.'
      @status = true
    else
      #render :edit
      @status = false
    end
  end

  # DELETE /minutes/1
  def destroy
    @minute.destroy
    #redirect_to minutes_url, notice: 'Minute was successfully destroyed.'
  end

  private

    def set_minute
      #@minute = Minute.find(params[:id])
      @minute = current_user.minutes.find_by(id: params[:id])
      redirect_to(minutes_url, alert: "ERROR!!") if @minute.blank?
    end

    def minute_params
      params.require(:minute).permit(:category, :content, :start, :stop, :total, :user_id)
    end
end
