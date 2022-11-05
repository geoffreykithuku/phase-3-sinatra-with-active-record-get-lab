class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end


   get '/bakeries/:id' do 
    id = params[:id]
    bakeries = Bakery.find(id)
    bakeries.to_json(include: :baked_goods)
   end

   get '/baked_goods/by_price' do 
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
   end

   get '/baked_goods/most_expensive' do 
    baked_goods = BakedGood.all.order(price: :desc)
    expe = baked_goods.first
    expe.to_json
   end
end
