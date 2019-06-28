class StaticController < ApplicationController
 def show
   render params[:heroine]
 end
end
