class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save ? (redirect_to recipe_path(@recipe)) : (render :new)
  end

  def show
  end

  def edit
  end

  def update
    @recipe.ingredients = []
    @recipe.update(recipe_params) ? (redirect_to recipe_path(@recipe)) : (render :edit)
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end


  private


  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_names:[])
  end

end
