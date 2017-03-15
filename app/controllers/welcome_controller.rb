class WelcomeController < ApplicationController
  def index
    #@items = Item.all.order("updated_at DESC").limit(30)
    @items = Item.all.select('COUNT(items.id) as items_count, items.*')
                 .joins('LEFT OUTER JOIN ownerships ON items.id = ownerships.item_id')
                 .group('items.id')
                 .order('items_count')
                 #.page(params[:page]).per(20)
  end
end
