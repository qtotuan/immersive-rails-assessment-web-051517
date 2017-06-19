class GuestsController < ApplicationController

  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.create(guest_params)
    if @guest.save
      redirect_to guest_path(@guest)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @guest.update(guest_params)
    redirect_to guest_path(@guest)
  end

  def destroy
    @guest.delete
    redirect_to guests_path
  end


  private

  def guest_params
    params.require(:guest).permit(:name, :occupation)
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end

end
