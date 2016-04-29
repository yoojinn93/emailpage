require 'mailgun'

class HomeController < ApplicationController
  def index
  end

  def success
    
      @emailto_ = params[:emailto]
      @title_ = params[:title]
      @content_ = params[:content]
      
      mg_client = Mailgun::Client.new("key-725e994f9ff7cc311463453c5b7004a0")
  
      message_params =  {
                         from: 'skku@skku.edu',
                         to:   @emailto_,
                         subject: @title_,
                         text:    @content_,
                        }
      
      result = mg_client.send_message('sandbox4c781b7086274f39a9f5a639e9d05962.mailgun.org', message_params).to_h!
      
      message_id = result['id']
      message = result['message']
      
      
      new_sendmail = Sendmail.new
      new_sendmail.emailto = params[:emailto]
      new_sendmail.title = params[:title]
      new_sendmail.content = params[:content]
      new_sendmail.save
      
      redirect_to "/list"

  end
  
  def list
      @every_sendmail = Sendmail.all.order("id desc")
  end
  
  def destroy
      @one_sendmail = Sendmail.find(params[:sendmail_id])
      @one_sendmail.destroy
      
      redirect_to "/list"
  end
  
  def update_view
      @one_sendmail = Sendmail.find(params[:sendmail_id])
  end
  
  def real_update
      @one_sendmail = Sendmail.find(params[:sendmail_id])
      
      @one_sendmail.emailto = params[:emailto]
      @one_sendmail.title = params[:title]
      @one_sendmail.content = params[:content]
      @one_sendmail.save
      
      redirect_to '/list'
  end
  
end
