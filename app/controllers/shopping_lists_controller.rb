class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: %i[ show edit update destroy ]

  # GET /shopping_lists or /shopping_lists.json
  def index
    @shopping_lists = ShoppingList.all.order(:product_category)
    @shopping_list = ShoppingList.new
    @product_categories = ProductCategory.all
  end

  # GET /shopping_lists/1 or /shopping_lists/1.json
  def show
  end

  # GET /shopping_lists/new
  def new
    @shopping_list = ShoppingList.new
  end

  # GET /shopping_lists/1/edit
  def edit
  end

  # POST /shopping_lists or /shopping_lists.json
  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list_in_db = ShoppingList.where(product_name: @shopping_list.product_name, product_category: @shopping_list.product_category)
    @records_quantity = @shopping_list_in_db.count
    respond_to do |format|
      if @shopping_list.save
        if @shopping_list_in_db.count > 1
          @shopping_list_in_db.update(product_quantity: @shopping_list_in_db.first.product_quantity + @shopping_list.product_quantity)
          @shopping_list.destroy
        end
        format.html { redirect_to shopping_lists_path }
        format.json { render :show, status: :created, location: @shopping_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_lists/1 or /shopping_lists/1.json
  def update
    respond_to do |format|
      if @shopping_list.update(shopping_list_params)
        format.html { redirect_to shopping_list_url(@shopping_list), notice: "Shopping list was successfully updated." }
        format.json { render :show, status: :ok, location: @shopping_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_lists/1 or /shopping_lists/1.json
  def destroy
    @shopping_list.destroy

    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: "Shopping list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def all_delete
    ShoppingList.where(is_bought: true).delete_all
    redirect_to shopping_lists_path
  end

  def change_is_bought
    @shopping_list = ShoppingList.find_by(id: params[:id])
    if @shopping_list.is_bought == true
      @shopping_list.update(is_bought: false)
      redirect_to shopping_lists_path
    elsif @shopping_list.is_bought == false
      @shopping_list.update(is_bought: true)
      redirect_to shopping_lists_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_list_params
      params.require(:shopping_list).permit(:product_name, :product_quantity, :product_category, :is_bought)
    end
end
