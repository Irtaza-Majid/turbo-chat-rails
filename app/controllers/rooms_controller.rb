class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)
    render 'index'
  end

  def create
    @room = Room.create(name: params['room']['name'])
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id]) if params[:id]

    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    render 'index'
  end
end
