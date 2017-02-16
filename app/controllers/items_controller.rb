class ItemsController < ApplicationController
  respond_to :html, :js
  def create
    # Use current_user instead of params[:user_id] for security reasons
    @item = current_user.items.build(items_params)

    # Save the created item

    if @item.save
      flash[:notice] = "Item was saved"
    else
      flash.now[:alert] = "There was an error saving item. Please try again"
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @item = @user.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item was deleted"
    else
      flash.now[:alert] = "Item could not be deleted. :("
    end
  end
private
  def items_params
    params.require(:item).permit(:name)
  end

end
