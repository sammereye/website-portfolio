class MainController < ApplicationController
    def send_message
        data = params[:message]

        puts(data)

        newMessage = Message.new(email: data['email'], name: data['name'], message: data['message'])

        if newMessage.valid?
            newMessage.save
            respond_to do |format|
                format.json { render json: {'success': true} }
            end
        end
    end
end
