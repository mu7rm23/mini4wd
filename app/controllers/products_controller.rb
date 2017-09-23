class ProductsController < ApplicationController
  before_action :set_categroy, only: [:list, :search, :detail]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def list
    @products = Product.all
  end

  def search
    @title = "＜検索条件＞"
    if (params[:chassis]=="すべて")
      condition = ""
    else
      condition = params[:chassis] + "=true AND "
      @title << "\n　使用シャーシ : "+params[:chassis]
    end

    if (params[:category]=="すべて")
      condition << "name ilike '%"+ params[:keyword] +"%'"
      @products = Product.where(condition)
    else
      condition << "category = '"+ params[:category] + "' AND name ilike '%"+ params[:keyword] +"%'"
      @products = Product.where(condition)
      @title << "\n　カテゴリ : "+params[:category]
    end

    if (params[:keyword]!="")
      @title << "\n　キーワード : "+params[:keyword]
    end

    @pre_keyword = params[:keyword]
    @selected_chassis = params[:chassis]
    @selected_category = params[:category]

  end

  def detail
    @pre_keyword = params[:keyword]
    @selected_chassis = params[:chassis]
    @selected_category = params[:category]

    id = params[:id]
    @product = Product.find(id)
    puts(@product)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categroy
      @result = Product.select(:category).uniq
      @category_list = [["すべてのパーツ","すべて"]]
      @result.each do |category|
        fact = [category.category,category.category]
        @category_list.push(fact)
      end

      @chassis_list = [
      ["すべてのシャーシ","すべて"],
      ["ゼロ","zero_chassis_flag"],
      ["タイプ5","type5_chassis_flag"],
      ["スーパーⅠ","s1_chassis_flag"],
      ["スーパーⅡ","s2_chassis_flag"],
      ["スーパーFM","sfm_chassis_flag"],
      ["スーパーTZ","stz_chassis_flag"],
      ["スーパーX","sx_chassis_flag"],
      ["スーパーXX","sxx_chassis_flag"],
      ["VS","vs_chassis_flag"],
      ["スーパーTZX","stzx_chassis_flag"],
      ["AR","ar_chassis_flag"],
      ["MS","ms_chassis_flag"],
      ["MA","ma_chassis_flag"],
      ["FMA","fma_chassis_flag"]]

      @selected_chassis = "すべて"
      @selected_category = "すべて"

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:tamiya_id, :category, :name, :price, :keyword, :zero_chassis_flag, :type5_chassis_flag, :s1_chassis_flag, :s2_chassis_flag, :sfm_chassis_flag, :stz_chassis_flag, :sx_chassis_flag, :sxx_chassis_flag, :vs_chassis_flag, :stzx_chassis_flag, :ar_chassis_flag, :ms_chassis_flag, :ma_chassis_flag, :fma_chassis_flag)
    end
end
