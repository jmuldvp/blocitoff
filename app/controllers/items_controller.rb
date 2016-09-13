class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = @user.items.new(item_params)
    # @new_item = Item.new

    if @item.save
      flash[:notice] = "Item saved successfully."
    else
      flash[:alert] = "Comment failed to save."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = current_user
    @item = @user.items.find(item_params)

    if @item.destroy
      flash[:notice] = "Item was deleted successfully."
    else
      flash[:alert] = "Item couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end

end
