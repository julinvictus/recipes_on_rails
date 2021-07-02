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
    @recipe = Recipe.find_or_create_by(trusted_params)
    @recipe.save!
    # add Ingredient.exists? (like scenario_geo_layers)
    @ingredient = Ingredient.find_or_create_by(ingredient: params[:recipe][:ingredient])
    # @ingredient.save!

    new_ingredient_recipe = IngredientRecipe.new(
      ingredient_id: @ingredient.id,
      recipe_id: @recipe.id,
    )
    new_ingredient_recipe.save!

    # respond_to do |format|
    #   if @recipe.save

    redirect_to @recipe, notice: "Recipe was successfully created."

    #     format.json { render :show, status: :created, location: @recipe }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @recipe.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trusted_params
      # byebug
      params.require(:recipe).permit(:recipe_url, :name)
    end
end
