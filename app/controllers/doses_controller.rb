class DosesController < ApplicationController

  def new
    @cocktail = Cockatil.find(params[:id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.create(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # raise
    @dose.cocktail = @cocktail
    # raise
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private 
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
