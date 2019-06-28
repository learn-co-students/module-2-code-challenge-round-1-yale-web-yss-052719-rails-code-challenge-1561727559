class HeroinesController < ApplicationController
  def index
    @heroines = if params[:term]
      Heroine.all.select do |heroine|
        heroine.power.name == params[:term]
      end
    else
      Heroine.all
    end
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    @powers = Power.all
  
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash.now[:error] = @heroine.errors.full_messages
      render :new
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :term)
  end

end
