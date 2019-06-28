class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def search 
    power_name = params[:q]
    @heroines = Heroine.all.select{|h| h.power.name == power_name}
    render :index
  end
  
  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:error] = @heroine.errors.full_messages
      render :new
    end
  end

  def edit 
    set_heroine
  end

  def update
    set_heroine
    @heroine.update(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:error] = @heroine.errors.full_messages
      render :edit
    end
  end 

  def destroy
    set_heroine
    @heroine.destroy
    redirect_to heroines_path
  end

  private

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
