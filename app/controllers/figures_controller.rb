class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids] if params[:figure][:title_ids]
    @figure.landmarks = params[:figure][:title_ids]
    # binding.pry
  end

end
