class ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items, include: :user
  end
  def show
    item = Item.find_by(user_id: params[:user_id], id: params[:id])
    if item
    render json: item
    else
    render json:{error: 'Item not found'}, status: :not_found
  end
end

def create
  user = user.find(params[:user_id])
  item = user.items.build(item_params)
  if item.save
  render json: item, status: :created
  elserender json:{error: item.errors.full_messages}, status: :unprocessable_entity
  end
end

private

  def item_params
    params.require(:item).permit(:name,:description,:price)
  end
end
