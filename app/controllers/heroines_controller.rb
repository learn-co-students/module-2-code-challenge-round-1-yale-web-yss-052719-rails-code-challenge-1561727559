class HeroinesController < ApplicationController
  def index
    if params[:q]
      power = Power.find_by(name: params[:q])
      power ? @heroines = Heroine.where(power_id: power.id) : @heroines = []
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)

    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:alert] = @heroine.errors.full_messages
      render :new

    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end


end
