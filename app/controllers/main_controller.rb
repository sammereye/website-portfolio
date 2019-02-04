class MainController < ApplicationController
    def send_message
        data = params[:message]

        ActionMailer::Base.mail(
            from: "iamsammert@gmail.com", 
            to: "iamsammert@gmail.com", 
            subject: data.name, 
            body: data.email + ' | ' + data.message
        ).deliver_now

        respond_to do |format|
            format.json { render json: {'success': true} }
        end
    end
end
