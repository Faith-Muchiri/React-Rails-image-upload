class RecipesController < ApplicationController
  before_action :set_recipe, only: [:update]

  # GET /api/recipes
  def index
    render json: Recipe.all
  end

  # PUT /api/recipes/1
#   def update
#     if @recipe.update(recipe_params)
#       render json: @recipe
#     else
#       render json: @recipe.errors, status: :unprocessable_entity
#     end
#   end
def update
  if UpdateRecipeService.new(@recipe, recipe_params).call
    render json: @recipe
  else
    render json: @recipe.errors, status: :unprocessable_entity
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.permit(:title, :description, :instruction, :image)
    end
end