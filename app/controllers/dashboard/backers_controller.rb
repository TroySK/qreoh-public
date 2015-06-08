class Dashboard::BackersController < ApplicationController
  
  require 'will_paginate/array'
  before_filter :authenticate_user!, :admin_only
  layout 'admin_layout'

  def index
    @backers = Backer.paginate(:page => params[:page], :per_page => 5)
    render :list
  end

  def incomplete
    @backers = Order.where({:confirmed => false}).collect(&:backer).uniq.paginate(:page => params[:page], :per_page => 5)
    render :list
  end

  def successful
    @backers = Order.where({:confirmed => true}).collect(&:backer).uniq.paginate(:page => params[:page], :per_page => 5)
    render :list
  end

  def screw_ups
    @backers = []
    Order.all.each do |order|
      @backers.push(order.backer) if order.shipping_address.blank? 
    end
    render :list
  end

end
