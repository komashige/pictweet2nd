class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    if params[:user_id]
      @tweets = Tweet.where(user_id: params[:user_id]).order("created_at DESC")
    else
      @tweets = Tweet.order("created_at DESC")
    end
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    
    if @tweet.save
      redirect_to '/'
    else
      puts @tweet.errors.full_messages 
      render :new
    end
  end

  def draw
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  def edit   
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  def show 
    @tweets = Tweet.order("created_at DESC")   
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  
  
  private
  def tweet_params
    params.require(:tweet).permit(:image, :text, :canvas_data).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

