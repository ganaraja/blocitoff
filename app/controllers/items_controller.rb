class ItemsController < ApplicationController
  def create
    # Use current_user instead of params[:user_id] for security reasons
    @user = User.find(current_user.id)
    @item = @user.items.build(items_params)

    # Save the created item

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
