class RecipesController < ApplicationController
   before_action :set_recipe, only: %i[show update destroy]

  # GET /api/recipes
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  # GET /posts/1
  def show
    render json: @recipe
  end

    # POST /posts
  def create
    @recipe = Recipe.create(recipe_params)

    if @recipe
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

    # DELETE /posts/1
  def destroy
    @recipe.destroy
  end


  def latest
    @recipe = Recipe.last
    render json: @recipe
    # RecipeSerializer.new(@recipe).serializable_hash[:data][:attributes]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end


    def recipe_params
      params.permit(:title, :description, :instruction, :image)
    end
end