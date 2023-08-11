class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
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
    @product_categories = ProductCategory.all
  end

  # POST /shopping_lists or /shopping_lists.json
  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list_in_db = ShoppingList.where(product_name: @shopping_list.product_name)
    @records_quantity = @shopping_list_in_db.count
    @product = AllProduct.where(name: @shopping_list.product_name)
    respond_to do |format|
      if @shopping_list.save
        #delete all records which are bought from shopping list
        ShoppingList.where(is_bought: true, product_name: @shopping_list.product_name).delete_all
        #Update category of shopping list record if product already exist and has different category in AllProducts table
        if @product&.exists?
          @shopping_list.update(product_category: @product.first.category)
        else
          AllProduct.create(name: @shopping_list.product_name, category: "1new")
        end
        #Update record quantity if already exist in shopping list
        if @shopping_list_in_db.count > 1
          @shopping_list.update(product_quantity: @shopping_list_in_db.first.product_quantity + @shopping_list.product_quantity)
          @shopping_list_in_db.first.destroy
        end
        #Delete records with 0 quantity
        if @shopping_list.product_quantity <= 0
          @shopping_list.destroy
        end
        format.html { redirect_to shopping_lists_path }
        format.json { render :show, status: :created, location: @shopping_list }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_lists/1 or /shopping_lists/1.json
  def update
    respond_to do |format|
      if @shopping_list.update(shopping_list_params)
        AllProduct.where(name: @shopping_list.product_name).update(category: @shopping_list.product_category)
        format.html { redirect_to shopping_lists_path }
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
