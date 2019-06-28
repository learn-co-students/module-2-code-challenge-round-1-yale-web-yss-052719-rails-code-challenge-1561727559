class HeroinesController < ApplicationController
  def index
    if params[:power]
      @heroines = Heroine.where(power_id: Power.find_by(name: params[:power]).id)
    else
      @heroines = Heroine.all
    end
  end

  def show
    find_heroine
  end

  def new
    @heroine = Heroine.new
    all_powers
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash.now[:error] = @heroine.errors.full_messages
      all_powers
      render :new
    end
  end

## additional RESTful routes -- edit, update, delete -- are added below for the sake of practice

  def edit
    find_heroine
    all_powers
  end

  def update
    find_heroine
    @heroine.update(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash.now[:error] = @heroine.errors.full_messages
      all_powers
      render :edit
    end
  end

  def destroy
    find_heroine
    @heroine.destroy
    redirect_to heroines_path
  end

  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def all_powers
    @powers = Power.all
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
