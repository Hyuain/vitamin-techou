class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.page params[:page]
    # pagination using id
    # items = Item.where("id > ?", params[:start_id]).limit(100)
    render json: { resources: items }
  end

  def create
    item = Item.new amount: 1
    if item.save
      render json: { resources: item }
    else
      head 404
    end
  end
end
