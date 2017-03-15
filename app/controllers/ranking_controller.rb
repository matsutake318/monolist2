class RankingController < ApplicationController
  def have
    @title = "Have ランキング"
    counts = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id)
    @counts = counts.values
    ids = counts.keys
    @items = Item.find(ids).sort_by{|o| ids.index(o.id)}
    render 'ranking'
  end

  def want
    @title = "Wantランキング"
    @counts = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id)
    ids = @counts.keys
    @items = Item.find(ids).sort_by{|o| ids.index(o.id)}
    render 'ranking'
  end
end

  # def want
  #   @title = "Wantランキング"
  #   @counts = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id)
  #   ids = @counts.keys
  #   @items = Item.find(ids).sort_by{|o| ids.index(o.id)}
  #   render 'ranking'
  # end