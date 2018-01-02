class OrderItemsController < ApplicationController
  def create
  @order = current_order
  if @order.order_items.exists?(:product_id => item_params[:product_id])
    order_item = @order.order_items.where(:product_id =>
    item_params[:product_id]).first
      current_quantity = order_item.quantity
      quantity_to_add = item_params[:quantity].to_i
      order_item.quantity = current_quantity + quantity_to_add
      order_item.save!
  else
    @item = @order.order_items.new(item_params)
  end
  if @order.save
    session[:order_id] = @order.id
      flash[:notice] = "This product has been added to your order."
    redirect_to root_path
  else
    flash[:notice] = "add an item"
    redirect_to root_path
  end
end

def show
  @order = current_order
  @item = @order.order_items.find(params[:id])
end

def edit
  @order = current_order
  @item = @order.order_items.find(params[:id])
end

def update
  @order = current_order
  @item = @order.order_items.find(params[:id])
  if @item.update(item_params)
    flash[:notice] = "Cart updated!"
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js { render "products/show" }
    end
  else
    render :edit
  end
end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    flash[:notice] = "Item deleted!"
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
