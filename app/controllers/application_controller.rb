class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes
    get '/bakeries' do
      # get all the bakeries from the database
    # send them back as a JSON array
    bakeries = Bakery.all
    bakeries.to_json 
    end

    get '/bakeries/:id' do
      bakery = Bakery.find(params[:id])
      bakery.to_json(include: :baked_goods)
    end 

    get '/baked_goods/by_price' do
      bakedGoods = BakedGood.by_price
      bakedGoods.to_json
    end 

    get '/baked_goods/most_expensive' do
      bakedGoods = BakedGood.by_price.first
      bakedGoods.to_json
    end 

end
