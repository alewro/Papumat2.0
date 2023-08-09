class RecipeCheckingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe_checking = RecipeChecking.new
  end

  def edit
  end

  def create
    @recipe_checking = RecipeChecking.new(recipe_checking_params)

    respond_to do |format|
      if @recipe_checking.save
        format.html { redirect_to recipes_path }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_checking.update(recipe_checking_params)
        format.html { redirect_to root_path, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_checkings
      @recipe_checking = RecipeChecking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_checking_params
      params.require(:recipe_checking).permit(:meal_plan_id, :recipe_id, :is_done)
    end
end

end

