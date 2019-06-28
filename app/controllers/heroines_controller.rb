class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

end
