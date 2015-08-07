class API::EventsController < ApplicationController
   before_filter :set_access_control_headers
   skip_before_action :verify_authenticity_token
 
   def create
      registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
        # binding.pry


      if registered_application.nil?
        #this will happen if the application that the request is sent from
        #is not already registerd in the database
        puts "First Failure"
        render json: "Unregistered application", status: :unprocessable_entity
      else
        @event = registered_application.events.build

        @event.name = params[:event_name]
          
        if @event.save
          render json: @event, status: :created
        else
          puts "Second Failure"
          render @event.errors, status: :unprocessable_entity
        end
      end
    end
 


  private

  # def event_params
  #   params.permit(:event_name)
  # end


  def set_access_control_headers
    #allows requests from any origin
    headers['Access-Control-Allow-Origin'] = '*'
    #permit Post,Get, Options request methods
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #allow header content-Type, this is used in HTTP requests to declare the type of data being sent
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end
end