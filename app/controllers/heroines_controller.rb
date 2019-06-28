class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    @heroines = Heroine.search_for_power(params[:search])
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
    if @heroine.valid?
      @heroine.save
      redirect_to heroines_path
    else
      flash[:error] = @heroine.errors.full_messages
      @powers = Power.all
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end


end
