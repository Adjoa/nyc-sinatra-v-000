class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids] if params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids] if params[:figure][:landmark_ids]
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    # binding.pry
  end

end
