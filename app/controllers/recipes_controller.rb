class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :set_user
  before_action :set_recipe_categories
  before_action :set_product_categories
  before_action :authenticate_user!
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
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
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        @recipe.products.each do |product|
          @all_product = AllProduct.find_by(name: product.name)
          if @all_product.nil?
            AllProduct.create(name: product.name, category: "1new")
          end
        end
        format.html { redirect_to recipes_path, notice:"Recipehas beem created successfully" }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        @recipe.products.each do |product|
          @all_product = AllProduct.find_by(name: product.name)
          if @all_product.nil?
            AllProduct.create(name: product.name, category: "1new")
          end
        end
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
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

  def change_is_done
    @recipe_checking = RecipeChecking.where(meal_plan_id: params[:meal_plan_id], recipe_id: params[:recipe_id]).first
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    if @recipe_checking.is_done == true
      @recipe_checking.update(is_done: false)
      redirect_to meal_plan_path(@meal_plan)
    elsif @recipe_checking.is_done == false
      @recipe_checking.update(is_done: true)
      redirect_to meal_plan_path(@meal_plan)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :recipe_category_id, products_attributes: [:id, :name, :quantity, :_destroy])
    end

    def set_user
      @user = current_user
    end

    def set_recipe_categories
      @recipe_categories = RecipeCategory.all.order(:id)
    end

    def set_product_categories
      @product_categories = ProductCategory.all.order(:name)
    end
end
