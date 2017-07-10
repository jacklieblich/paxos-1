class MessagesController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :error_message
	def create
		message = Message.create(content: params[:message])
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

	def error_message
		render json: {
			"err_msg": "Message not found"
		}, status: :not_found
	end
end
