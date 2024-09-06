# app/controllers/lps_controller.rb
class LpsController < ApplicationController
  before_action :set_lp, only: [:show, :edit, :update, :destroy]
  def index
    @selected_artist = params[:artist_id] # This sets the selected_artist to the value from params
    if @selected_artist.present?
      @lps = Lp.where(artist_id: @selected_artist)
    else
      @lps = Lp.all
    end
  end
  

  def show
  end

  def new
    @lp = Lp.new
  end

  def create
    @lp = Lp.new(lp_params)
    if @lp.save
      redirect_to @lp, notice: 'LP was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lp.update(lp_params)
      redirect_to @lp, notice: 'LP was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lp.destroy
    redirect_to lps_url, notice: 'LP was successfully deleted.'
  end

  private

  def set_lp
    @lp = Lp.find(params[:id])
  end

  def lp_params
    params.require(:lp).permit(:name, :description, :artist_id)
  end
end
