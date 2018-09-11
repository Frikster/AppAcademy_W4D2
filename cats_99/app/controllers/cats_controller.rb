class CatsController < ApplicationController
  
  def index 
    @cats = Cat.all 
    render :index 
  end 
  
  def show
    @cat = Cat.find(params[:id])
    render :show
  end 
  
  def new
    @cat = Cat.new
    render :new
  end 
  
  def create 
    debugger
    @cat = Cat.new(cat_params)
    if @cat.save 
      redirect_to cats_url
    else 
      render :new 
    end 
  end 
  
  def edit 
    @cat = Cat.find(params[:id])
    render :edit
    cat = Cat.new(params[:cat])
    
  end 
  
  
  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
  end 
end