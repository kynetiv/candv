class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.find(params[:id])
  end

  def new
    @products = Product.new
  end

  def edit
    @products = Product.find(params[:id])
  end

  def create
    @product = Category.find_by_id(params[:id]).products.new(params[:product])

    if @product.save
      flash[:success] = "Product Added"
      redirect_to products_path

    else
      render 'new'
    end
  end

  def update
    @products = Product.find(params[:id])

    if @products.update_attributes(params[:update])
      flash[:success] = "Success: Product Updated!"
      redirect_to @products

    else
      render 'edit'
      
    end
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy

    flash[:danger] = "Product Deleted"
    redirect_to products_url
  end
end
