class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    find_power
  end

  private

  def find_power
    @power = Power.find(params[:id])
  end
end
