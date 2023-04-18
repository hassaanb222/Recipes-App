class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe_foods = RecipeFood.where(recipe_id: params[:id])
    @foods = Food.all
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end