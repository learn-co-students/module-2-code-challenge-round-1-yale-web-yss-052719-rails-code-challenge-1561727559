class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash.now[:error] = @heroine.errors.full_messages
      render :new
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
    @powers = Power.all

  end


  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
