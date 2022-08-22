class MinutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minute, only: [:show, :edit, :update, :destroy]
    
  # GET /minutes
  def index
    @minutes = current_user.minutes.all
    @array = []
    @minutes.select(:start).each{|item|
      @array.push(item.start.strftime("%Y/%m/%d"))
    }
    if params['date'] != nil
      @minutes_date = @minutes.where("start like ?", params['date'].to_date.in_time_zone.localtime.strftime("%Y-%m-%d") + '%')
    else
      @minutes_date = @minutes.where("start like ?", Date.current.in_time_zone.localtime.strftime("%Y-%m-%d") + '%')
    end
    @category_total = @minutes_date.group(:category).sum(:total)
    if params['date'] != nil
      @month = @minutes.where("start like ?", params['date'].to_date.in_time_zone.localtime.strftime("%Y-%m") + '%')
    else
      @month = @minutes.where("start like ?", Date.current.in_time_zone.localtime.strftime("%Y-%m") + '%')
    end
    @category_month = @month.group(:category).sum(:total)
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
    @minute.total = @minute.getTimeDiff
    @minute.save
  end

  # POST /minutes
  def create
    @minute = current_user.minutes.new(minute_params)
    if @minute.save
      @status = true
      @minute_new = @minute.start.strftime("%Y-%m-%d") 
      redirect_to "/minutes/?date=#{@minute_new}"
    else
      @status = false
    end
  end

  # PATCH/PUT /minutes/1
  def update
    if @minute.update(minute_params)
      @status = true
      @minute.total = @minute.getTimeDiff
      @minute.save
      @minute_ed = @minute.start.strftime("%Y-%m-%d") 
      redirect_to "/minutes/?date=#{@minute_ed}"
    else
      @status = false
    end
  end

  # DELETE /minutes/1
  def destroy
    @minute.destroy
    @minute_dl = @minute.start.strftime("%Y-%m-%d")
    redirect_to "/minutes/?date=#{@minute_dl}"
  end

  private

    def set_minute
      @minute = current_user.minutes.find_by(id: params[:id])
      redirect_to(minutes_url, alert: "ERROR!!") if @minute.blank?
    end

    def minute_params
      params.require(:minute).permit(:category, :content, :start, :stop, :total, :user_id)
    end
end
