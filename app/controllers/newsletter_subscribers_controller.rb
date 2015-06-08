class NewsletterSubscribersController < ApplicationController

  def create
    @newsletter_subscriber = NewsletterSubscriber.new(:email => params[:email])
    @newsletter_subscriber.save
    cookies['subscriber'] = {:value => 1, :expires => 1.year.from_now }
    respond_to do |format|
      if @newsletter_subscriber.save
        format.html {
          flash[:notice] = 'You have been subscribed!'
          redirect_to :back 
        }
        format.json { render :json => {:success => true} }
      else
        format.html {
          flash[:notice] = 'Something went wrong! Please try again later.'
          redirect_to :back 
        }
        format.json { render :json => {:success => false} }
      end
    end
  end
end
