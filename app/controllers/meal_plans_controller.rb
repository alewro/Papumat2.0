class MealPlansController < ApplicationController
  before_action :set_meal_plan, only: %i[ show edit update destroy ]
  before_action :set_recipe_checkings, only: %i[ show ]
  before_action :authenticate_user!

  # GET /meal_plans or /meal_plans.json
  def index
    @meal_plans = MealPlan.all
  end

  # GET /meal_plans/1 or /meal_plans/1.json
  def show
    @category = RecipeCategory.all
  end

  # GET /meal_plans/new
  def new
    @meal_plan = MealPlan.new
  end

  # GET /meal_plans/1/edit
  def edit
  end

  # POST /meal_plans or /meal_plans.json
  def create
    @meal_plan = MealPlan.new(meal_plan_params)
    respond_to do |format|
      if @meal_plan.save
        @bought_products = ShoppingList.where(is_bought: true)
        @bought_products.delete_all
        @meal_plan.recipe_ids.each do |recipe_checking|
          RecipeChecking.create(meal_plan_id: @meal_plan.id,
                                recipe_id: recipe_checking,
                                is_done: false)
        end
        @meal_plan.recipes.each do |recipe|
          recipe.products.each do |product|
            @all_product = AllProduct.find_by(name: product.name)
            if @all_product.category != ProductCategory.find_by(id: product.product_category_id).name
              product.update(product_category_id: ProductCategory.find_by(name: @all_product.category).id)
            end
            @shopping_list = ShoppingList.create(product_name: product.name,
                                product_quantity: product.quantity,
                                product_category: product.product_category.name,
                                is_bought: false)
            @shopping_list_in_db = ShoppingList.where(product_name: @shopping_list.product_name)
              if @shopping_list_in_db.count > 1
                @shopping_list_in_db.update(product_quantity: @shopping_list_in_db.first.product_quantity + @shopping_list.product_quantity)
                @shopping_list.destroy
              end
          end
        end
        format.html { redirect_to meal_plan_url(@meal_plan), notice: "Meal plan was successfully created." }
        format.json { render :show, status: :created, location: @meal_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_plans/1 or /meal_plans/1.json
  def update
    respond_to do |format|
      if @meal_plan.update(meal_plan_params)
        @meal_plan.recipe_ids.each do |recipe_checking|
          RecipeChecking.create(meal_plan_id: @meal_plan.id,
                                recipe_id: recipe_checking,
                                is_done: false)
        end
        format.html { redirect_to meal_plan_url(@meal_plan), notice: "Meal plan was successfully updated." }
        format.json { render :show, status: :ok, location: @meal_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_plans/1 or /meal_plans/1.json
  def destroy
    @meal_plan.destroy

    respond_to do |format|
      format.html { redirect_to meal_plans_url, notice: "Meal plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_plan
      @meal_plan = MealPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_plan_params
      params.require(:meal_plan).permit(:start_date, :end_date, {recipe_ids: []} )
    end

    def set_recipe_checkings
      @recipe_checkings = RecipeChecking.where(meal_plan_id: @meal_plan.id).all
    end
end
