# require "africastalking"
# require "africastalking/sms"

# class SmsController < ApplicationController
#   def new
#   end

#   #   def create
#   #     if params[:message].present?
#   #       message = params[:message]
#   #       to = params[:to]
#   #       from = params[:from] || "MYAPP"
#   #       enqueue = params[:enqueue] || false

#   #       # Send the SMS using the AfricasTalking SDK
#   #       africastalking = AfricasTalking::Initialize.new("chris_siku", "aee5db577d1dbd8bbe8d733f8837f328fd775facc87e7b66e1818d60b4dda375")
#   #       sms = africastalking.sms
#   #       response = sms.send({
#   #         message: message,
#   #         to: to,
#   #         from: from,
#   #         enqueue: enqueue,
#   #       })

#   #       # Handle the response as necessary
#   #       if response["status"] == "success"
#   #         flash[:notice] = "SMS sent successfully!"
#   #         redirect_to new_sms_path
#   #       else
#   #         flash[:error] = "SMS failed to send: #{response["message"]}"
#   #         render :new
#   #       end
#   #     else
#   #       flash[:error] = "Please provide a message."
#   #       render :new
#   #     end
#   #   end

#   def create
#     if sms_params[:message].present?
#       message = sms_params[:message]
#       to = sms_params[:to]
#       from = sms_params[:from] || "MYAPP"
#       enqueue = sms_params[:enqueue] || false

#       # Send the SMS using the AfricasTalking SDK
#       africastalking = AfricasTalking::Initialize.new("chris_siku", "aee5db577d1dbd8bbe8d733f8837f328fd775facc87e7b66e1818d60b4dda375")
#       sms = africastalking.sms
#       response = sms.send({
#         message: message,
#         to: to,
#         from: from,
#         enqueue: enqueue,
#       })

#       # Handle the response as necessary
#       if response["status"] == "success"
#         flash[:notice] = "SMS sent successfully!"
#         redirect_to new_sms_path
#       else
#         flash[:error] = "SMS failed to send: #{response["message"]}"
#         render :new
#       end
#     else
#       flash[:error] = "Please provide a message."
#       render :new
#     end
#   end

#   private

#   def sms_params
#     params.require(:sms).permit(:to, :from, :message, :enqueue)
#   end
# end

require "africastalking"
require "africastalking/sms"

class SmsController < ApplicationController
  def new
  end

  def create
    if sms_params[:message].present?
      message = sms_params[:message]
      to = sms_params[:to]
      from = sms_params[:from] || "MYAPP"
      enqueue = sms_params[:enqueue] || false

      # Send the SMS using the AfricasTalking SDK
      africastalking = AfricasTalking::Initialize.new(ENV["username"], ENV["api_key"])
      sms = africastalking.sms
      response = sms.send({
        message: message,
        to: to,
        from: from,
        enqueue: enqueue,
      })

      # Handle the response as necessary
      if response["status"] == "success"
        flash[:notice] = "SMS sent successfully!"
        redirect_to new_sms_path
      else
        flash[:error] = "SMS failed to send: #{response["message"]}"
        render :new
      end
    else
      flash[:error] = "Please provide a message."
      render :new
    end
  end

  private

  def sms_params
    params.require(:sms).permit(:to, :from, :message, :enqueue)
  end
end
