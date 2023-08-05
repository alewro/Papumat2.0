class RecipeDonesController < ApplicationController
  before_action :set_recipe_done, only: %i[ show edit update destroy ]

  # GET /recipe_dones or /recipe_dones.json
  def index
    @recipe_dones = RecipeDone.all
  end

  # GET /recipe_dones/1 or /recipe_dones/1.json
  def show
  end

  # GET /recipe_dones/new
  def new
    @recipe_done = RecipeDone.new
  end

  # GET /recipe_dones/1/edit
  def edit
  end

  # POST /recipe_dones or /recipe_dones.json
  def create
    @recipe_done = RecipeDone.new(recipe_done_params)

    respond_to do |format|
      if @recipe_done.save
        format.html { redirect_to recipe_done_url(@recipe_done), notice: "Recipe done was successfully created." }
        format.json { render :show, status: :created, location: @recipe_done }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_done.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_dones/1 or /recipe_dones/1.json
  def update
    respond_to do |format|
      if @recipe_done.update(recipe_done_params)
        format.html { redirect_to recipe_done_url(@recipe_done), notice: "Recipe done was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_done }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_done.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_dones/1 or /recipe_dones/1.json
  def destroy
    @recipe_done.destroy

    respond_to do |format|
      format.html { redirect_to recipe_dones_url, notice: "Recipe done was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_done
      @recipe_done = RecipeDone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_done_params
      params.require(:recipe_done).permit(:is_done)
    end
end
