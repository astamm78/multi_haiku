get '/' do
  @haiku = Haiku.find((1..Haiku.count).to_a.sample)
  erb :index
end

get '/haiku/:id' do
  @haiku = Haiku.find(params[:id])
  erb :index
end

get '/vote/:id' do
  Haiku.find(params[:id]).increment!(:votes)
  erb :all
end

get '/all' do
  erb :all
end

get '/newest' do
  @haiku = Haiku.order(:created_at).reverse.first
  erb :index
end

get '/create' do
  erb :create
end