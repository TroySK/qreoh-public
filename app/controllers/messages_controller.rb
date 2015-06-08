class MessagesController < ApplicationController

  before_filter :authenticate_user!
  layout 'inbound_layout'

  def index
    @messages = Message.where(:recipient_id => current_user.id, :archived => false)
    @message = Message.new
  end

  def send_message
    user_id = params["message"]["user_id"].to_i
    if user_id == current_user.id
      message = Message.create(params["message"])
      if message
        MessagesMailer.create(message).deliver
        MessagesMailer.notify(message).deliver
        flash[:message] = {
          'header' => "Message to #{message.recipient.email.gsub(/@.*/, '')} sent successfully."
        }
      else
        flash[:message] = {
          'header' => "There was a problem sending the message. Please try again."
        }
      end
    else
      flash[:message] = {
        'header' => "You are not supposed to do this."
      }
    end
    redirect_to :action => :index and return
  end

  def sent
    @messages = Message.where(:user_id => current_user.id)
    @message = Message.new
  end

  def archive
    @messages = Message.where(:recipient_id => current_user.id, :archived => true)
  end

  def delete
    message_id = params[:id].to_i
    message = Message.where(:id => message_id).first
    if message.recipient_id == current_user.id
      message.archived = true
      message.save
      flash[:message] = {
        'header' => "Message deleted."
      }
    else
      flash[:message] = {
        'header' => "You are not supposed to do this."
      }
    end
    redirect_to :action => :index and return
  end
  
end
