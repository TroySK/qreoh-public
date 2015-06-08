class Dashboard::TagDetailsController < ApplicationController
  before_filter :authenticate_user!, :admin_only
  layout 'admin_layout'

  def index
    @tag_details = TagDetail.all
    @remaining_tags = ActsAsTaggableOn::Tag.where("id NOT IN (?)", TagDetail.all.collect(&:tag_id)).collect do |tag| [tag.name, tag.id] end
    #@remaining_tags = ActsAsTaggableOn::Tag.all.collect do |tag| [tag.name, tag.id] end
    render :list
  end

  def create
    tag_detail = TagDetail.create(params[:tag_detail])
    redirect_to dashboard_tag_details_url
  end

  def destroy
    tag_detail = TagDetail.find(params[:id])
    tag_detail.destroy
    redirect_to dashboard_tag_details_url
  end
end