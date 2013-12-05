class AdressesController < ApplicationController
  
  def index
  end

  def new
    @adress = Adress.new
  end

  def create
    @adress = Adress.new(adress_params)
    if @adress.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def adress_params
    params.require(:adress).permit(:street, :number, :zipcode)
  end

end
