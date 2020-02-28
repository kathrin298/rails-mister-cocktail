class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]

  def index
    if params[:search_query].blank?
      @cocktails = Cocktail.all
    else
      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:search_query]}%")
    end
  end

  def show
    @ingredients = @cocktail.ingredients
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_param)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  private

  def cocktail_param
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
