require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    show_all
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    show_all
  end

  post '/posts' do
    @post = Post.create(params[:post]) if !params[:post].nil?
    show_all
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/show/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.update(params[:post])
    show_all
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.destroy
    erb :deleted
  end

  def show_all
    @posts = Post.all
    erb :index
  end
end
