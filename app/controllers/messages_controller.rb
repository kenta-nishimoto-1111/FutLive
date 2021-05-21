class MessagesController < ApplicationController
  def index
    @user = User.all
    @post = Post.find(params[:post_id])
    @message = Message.new
    @messages = @post.messages.includes(:user)
  end

  def create
    @post = Post.find(params[:post_id])
    @message = Message.new(message_params)
    if @message.save
      return redirect_to post_messages_path(@post.id)
    else
      @user = User.all
      render :index
    end
  end

private

def message_params
  params.require(:message).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
end
end
