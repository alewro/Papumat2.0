class RecipeCategoriesController < ApplicationController
  before_action :set_recipe_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /recipe_categories or /recipe_categories.json
  def index
    @recipe_categories = RecipeCategory.all
  end

  # GET /recipe_categories/1 or /recipe_categories/1.json
  def show
  end

  # GET /recipe_categories/new
  def new
    @recipe_category = RecipeCategory.new
  end

  # GET /recipe_categories/1/edit
  def edit
  end

  # POST /recipe_categories or /recipe_categories.json
  def create
    @recipe_category = RecipeCategory.new(recipe_category_params)

    respond_to do |format|
      if @recipe_category.save
        format.html { redirect_to recipe_category_url(@recipe_category), notice: "Recipe category was successfully created." }
        format.json { render :show, status: :created, location: @recipe_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_categories/1 or /recipe_categories/1.json
  def update
    respond_to do |format|
      if @recipe_category.update(recipe_category_params)
        format.html { redirect_to recipe_category_url(@recipe_category), notice: "Recipe category was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_categories/1 or /recipe_categories/1.json
  def destroy
    @recipe_category.destroy

    respond_to do |format|
      format.html { redirect_to recipe_categories_url, notice: "Recipe category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_category
      @recipe_category = RecipeCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_category_params
      params.require(:recipe_category).permit(:name)
    end
end
