class HeroinesController < ApplicationController
  def index
    if params[:q]
      # byebug
      if Power.find_by(name: params[:q].downcase) == nil
        flash[:alert] = "superpower not found"
        redirect_to '/heroines'
        # byebug
      else
        @power = Power.find_by(name: params[:q].downcase)
        @heroines = Heroine.where(power_id: @power.id)
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
    # byebug
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:error] = @heroine.errors.full_messages
      @powers = Power.all
      render :new
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :q)
  end
end
