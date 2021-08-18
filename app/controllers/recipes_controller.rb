class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.search(params[:search])
    @ingredients = Ingredient.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    begin
      ActiveRecord::Base.transaction do
        @recipe = Recipe.find_or_create_by!(trusted_params)
        @ingredient = Ingredient.find_or_create_by!(ingredient: params[:recipe][:ingredient])

        new_ingredient_recipe = IngredientRecipe.new(
          ingredient_id: @ingredient.id,
          recipe_id: @recipe.id,
        )
        new_ingredient_recipe.save!
  
        redirect_to @recipe, notice: "Recipe was successfully created."
      end
    rescue
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: "Recipe was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trusted_params
      params.require(:recipe).permit(:recipe_url, :name)
    end
end
