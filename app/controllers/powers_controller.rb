class PowersController < ApplicationController
  def index
    @powers = Power.all
    render :index
  end

  def show
    @power = Power.find(params[:id])
    render :show
  end


end
