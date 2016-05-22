class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(items_params)

    if @item.save
      flash[:notice] = "Item was saved"
    else
      flash.now[:alert] = "There was an error saving item. Please try again"
    end
    redirect_to [@user, @item]
  end

private
  def items_params
    params.require(:item).permit(:name)
  end

end
