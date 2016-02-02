class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all
		erb :'figures/index'
	end

	get '/figures/new' do
		erb :'figures/new'
	end

	get '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		erb :'figures/show'
	end

	get '/figures/:id/edit' do
		@figure = Figure.find_by_id(params[:id])
		erb :'figures/edit'
	end

	post '/figures' do
		@figure = Figure.create(params[:figure])
		@figure.titles.create(name: params[:title][:name]) unless params[:title][:name].empty?
		@figure.landmarks.create(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
		@figure.save
		erb :'figures/show'
	end

	patch '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		@figure.update(params[:figure])
		@figure.titles.create(name: params[:title][:name]) unless params[:title][:name].empty?
		@figure.landmarks.create(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
		@figure.save
		erb :'figures/show'
	end

end