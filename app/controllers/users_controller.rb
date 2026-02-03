class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @event_invitations = @user.invited_events
    @pending_events = current_user.pending_events
                              .where("datetime >= ?", Time.current)
                              .includes(:event_invitations)
  end

  def show_invited_events
    @event_invitations = @user.invited_events
  end

 private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
