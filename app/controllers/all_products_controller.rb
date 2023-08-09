class AllProductsController < ApplicationController
  before_action :set_all_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /all_products or /all_products.json
  def index
    @all_products = AllProduct.all
  end

  # GET /all_products/1 or /all_products/1.json
  def show
  end

  # GET /all_products/new
  def new
    @all_product = AllProduct.new
  end

  # GET /all_products/1/edit
  def edit
  end

  # POST /all_products or /all_products.json
  def create
    @all_product = AllProduct.new(all_product_params)

    respond_to do |format|
      if @all_product.save
        format.html { redirect_to all_product_url(@all_product), notice: "All product was successfully created." }
        format.json { render :show, status: :created, location: @all_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @all_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_products/1 or /all_products/1.json
  def update
    respond_to do |format|
      if @all_product.update(all_product_params)
        format.html { redirect_to all_product_url(@all_product), notice: "All product was successfully updated." }
        format.json { render :show, status: :ok, location: @all_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @all_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_products/1 or /all_products/1.json
  def destroy
    @all_product.destroy

    respond_to do |format|
      format.html { redirect_to all_products_url, notice: "All product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_product
      @all_product = AllProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def all_product_params
      params.require(:all_product).permit(:name, :category)
    end
end
