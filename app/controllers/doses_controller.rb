class DosesController < ApplicationController

  def create
    dose_params = params.require(:dose).permit(:description, :ingredient_id)
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params['cocktail_id'])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
