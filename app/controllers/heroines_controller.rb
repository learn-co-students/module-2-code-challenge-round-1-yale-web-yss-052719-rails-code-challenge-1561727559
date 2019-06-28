class HeroinesController < ApplicationController
  def index
    if params["heroines"] != nil
      @power = Power.find_by(id: params["heroines"]["ids"])
      @heroines = Heroine.all.where(power_id: @power.id)
    else
      @heroines = Heroine.all
    end
  end

  def show 
    @heroine = Heroine.find(params[:id])
  end

  def new 
    @powers = Power.all
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to(heroine_path(@heroine))
    else
      render :new
    end
  end

  private 

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
