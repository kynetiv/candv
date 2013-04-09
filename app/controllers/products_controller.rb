class ProductsController < ApplicationController
  def index
    @products = Product.all

  end

  def show
    @products = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      flash[:success] = "Product Added"
      redirect_to products_path

    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      flash[:success] = "Success: Product Updated!"
      redirect_to @product

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
