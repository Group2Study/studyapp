class GroupMeetingController < ApplicationController

  def index
    puts "GroupMeetingController: #{self.params[:id]}"

    @meeting = Meeting.find_by("group_id = #{params[:id]}")
    if @meeting
      @group = @meeting.group
    end

  end

  def send_message
    puts "GroupMeetingController:send_message MES: #{params[:message]} ID:  #{params[:id]}"

    puts "GroupMeetingController:send_message USER: #{current_user}"

    @message = MeetingMessage.new(text: params[:message], meeting_id: params[:message])
    @message.save

    respond_to do |format|
      format.json { render :json => @message }
    end

  end

  def get_messages

    puts "GroupMeetingController: MES: #{params[:last_message]} ID: #{params[:id]}"

    if params[:last_message]
      #busca a partir dessas
    else
      #busca algumas mensagens
      MeetingMessage.all(meeting_id: params[:id])
    end
  
  end

end
