class EpisodesController < ApplicationController

    before_action :set_episode, only: [:show, :edit, :update, :destroy]

    def index
      @episodes = Episode.all
    end

    def new
      @episode = Episode.new
    end

    def create
      @episode = Episode.create(episode_params)
      if @episode.save
        redirect_to episode_path(@episode)
      else
        render 'new'
      end
    end

    def show
    end

    def edit
    end

    def update
      @episode.update(episode_params)
      redirect_to episode_path(@episode)
    end

    def destroy
      @episode.delete
      redirect_to episodes_path
    end


    private

    def episode_params
      params.require(:episode).permit(:date, :number)
    end

    def set_episode
      @episode = Episode.find(params[:id])
    end

end
