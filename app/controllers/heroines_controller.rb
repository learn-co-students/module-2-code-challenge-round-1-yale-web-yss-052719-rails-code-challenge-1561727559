class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    render :index
  end

  def show
    @heroine = Heroine.find(params[:id])
    render :show
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
    render :new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    @powers = Power.all
    if @heroine.save
      
      redirect_to heroine_path(@heroine)
    else
      flash.now[:error] = @heroine.errors.full_messages
      render :new
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
