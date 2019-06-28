class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    set_power
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.create(power_params)
    if @power.valid?
      redirect_to new_heroine_path 
    else
      flash[:error] = @power.errors.full_messages
      render :new
    end
  end

  def edit
    set_power
  end

  def update
    set_power
    @power.update(power_params)
    if @power.valid?
      redirect_to powers_path
    else
      flash[:error] = @power.errors.full_messages
      render :edit
    end
  end

  private

  def set_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end
end
