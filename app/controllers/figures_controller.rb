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

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids] if params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids] if params[:figure][:landmark_ids]

    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end

    redirect "/figures/#{@figure.id}"
  end

end
