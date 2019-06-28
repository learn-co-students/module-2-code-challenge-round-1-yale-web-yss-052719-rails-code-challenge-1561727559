class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new 
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to(heroine_path(@heroine))
    else
      flash[:error] = @heroine.errors.full_messages
      render :new
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end


end
