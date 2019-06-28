class HeroinesController < ApplicationController
  def index
    if params[:search]
      power = Power.find_by(name: params[:search])
      if power
        @heroines = Heroine.where(power_id: power.id)
      else
        @heroines = []
      end
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash.now[:error] = @heroine.errors.full_messages
      @powers = Power.all
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
