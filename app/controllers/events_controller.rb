class EventsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "Event created!"
  		redirect_to root_url
  	else
  		render'static_pages/home'
  	end
  end

  def destroy
    @event.destroy
    redirect_to root_url
  end

  private
  def event_params
  	params.require(:event).permit(:event_type,
  								:name,
  								:date,
  								:time,
  								:budget,
  								:bride_name,
  								:groom_name)
  end

    def correct_user
        @event = current_user.events.find_by(id: params[:id])
        redirect_to root_url if @event.nil?
  end
end