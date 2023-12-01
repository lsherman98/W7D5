class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit, :update]

  def require_moderator
    @sub = Sub.find(params[:id])
    redirect_to sub_url(@sub) unless current_user == @sub.moderator
  end

  def new
    @sub = Sub.new
    render :new
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def index
    @subs = Sub.all
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = params[:user_id]

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end



  def sub_params
    params.require(:sub).permit(:title, :description)
  end


end
