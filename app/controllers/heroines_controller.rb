class HeroinesController < ApplicationController
  def index
   
    if params[:search]
    	@heroines = Heroine.search(params[:search])
    else
    	@heroines = Heroine.all
    end
  end

  def new
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
  	set_heroine
  end

  private

  def heroine_params
  	params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def set_heroine
  	@heroine = Heroine.find(params[:id])
  end
end
