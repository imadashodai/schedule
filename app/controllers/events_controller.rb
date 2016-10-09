class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
		session[:event] = @event
		@user = User.new
		@event_user = User.where(event_id: params[:id])
		@token = Token.find_by(event_id: @event.id)
	end

	def new
		@event = Event.new
		@token = Token.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			@token = Token.new
			@token.token = SecureRandom.hex
			@token.event_id = @event.id
			@token.save
			redirect_to event_path(@event), notice: 'create event'
		end
	end

	def event_token
		@token = Token.find_by(token: params[:token])
		if @token != nil
			@event = Event.find_by(id: @token.event_id)
			redirect_to new_user_path(@event)
			session[:event] = @event
		end
	end

	def new_user
		@user = User.new
		@event = session[:event]
	end

	def create_user
		@user = User.new(user_params)
		if @user.save
			@event_h = session[:event]
			@event = Event.find_by(id: @event_h['id'])
			@user.update(:event_id => @event.id)
			redirect_to event_path(@event)
		end
	end

	private
	def event_params
		params.require(:event).permit(:event_name, :event_at)
	end

	def user_params
		params.require(:user).permit(:name, :comment, :status_id, :event_id)
	end
end
