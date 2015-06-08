class Messenger

  @client = HipChat::Client.new(HIPCHAT[Rails.env]['api_key'], :api_version => 'v2')

  def self.order_notification(order)
    begin 
      @client['Orders'].get_room
    rescue HipChat::UnknownRoom
      @client.create_room('Orders')
    end
    @client['Orders'].send('QREOH', "@all - Yo! New Order in progress", :notify => true, :color => 'red', :message_format => 'text')
    message ="Order ID - #{order.id} <br> User  - #{order.user.email} <br>"
    order.projects.each do |project|
      message += "Project - #{project.title} <br>"
    end
    message += "Total - #{order.amount}"
    @client['Orders'].send('QREOH', message, :notify => true, :color => 'red')
  end
end