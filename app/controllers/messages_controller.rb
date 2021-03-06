class MessagesController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :error_message
	def create
		message = Message.find_or_create_by(message_params)
		render json: {
			digest: message.digest
		}
	end

	def show
		message = Message.find_by!(digest: params[:id])
		render json: {
			message: message.content
		}
	end

	private

	def error_message
		render json: {
			"err_msg": "Message not found"
		}, status: :not_found
	end

	def message_params
		params.require(:message).permit(:content)
	end
end
