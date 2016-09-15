class ItemsController < ApplicationController
  def create
    @user = User.find_by(params[:user_id])
    @item = @user.items.new(item_params)
    @new_item = Item.new

    if @item.save
      redirect_to [@user]
    end
  end

  def destroy
    @user = User.find_by(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
