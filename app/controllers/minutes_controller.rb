class MinutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minute, only: [:show, :edit, :update, :destroy]

  # GET /minutes
  def index
    @minutes = current_user.minutes.all
    @array = []
    @minutes.select(:created_at).each{|item|
      @array.push(item.created_at.strftime("%Y/%m/%d"))
    }
    if params['date'] != nil
      @minutes_date = @minutes.where("created_at like::text ?", params['date'].to_date.in_time_zone.strftime("%Y-%m-%d") + '%')
    else
      @minutes_date = @minutes.where("created_at like::text ?", Date.current.in_time_zone.strftime("%Y-%m-%d") + '%')
    end
    @category_total = @minutes_date.group(:category).sum(:total)
    if params['date'] != nil
      @month = @minutes.where("created_at::text like ?", params['date'].to_date.in_time_zone.strftime("%Y-%m") + '%')
    else
      @month = @minutes.where("created_at::text like?", Date.current.in_time_zone.strftime("%Y-%m") + '%')
    end
    @category_month = @month.group(:category).sum(:total)
  end

  # GET /minutes/1
  # def show
  # end

  # GET /minutes/new
  def new
    @minute = current_user.minutes.new({ :start => Time.now - 3600 })
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
      @minute.total = @minute.getTimeDiff
      @minute.save
      redirect_to minutes_url
    else
      #render :new
      @status = false
    end
  end

  # PATCH/PUT /minutes/1
  def update
    if @minute.update(minute_params)
      @status = true
      redirect_to minutes_url
    else
      #render :edit
      @status = false
    end
  end

  # DELETE /minutes/1
  def destroy
    @minute.destroy
    redirect_to minutes_url
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
