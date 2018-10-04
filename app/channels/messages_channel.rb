class MessagesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'messages'
  end
end  
# this method, subscribe, is responsible for 
# subscribing and streaming messages 