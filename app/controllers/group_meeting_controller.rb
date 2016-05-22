class GroupMeetingController < ApplicationController

  def index
    puts "GroupMeetingController: #{params[:id]}"

    @meeting = Meeting.find(params[:id])

    if @meeting
      @group = @meeting.group
    end

  end

  def send_message
    puts "GroupMeetingController:send_message MES: #{params[:message]} ID:  #{params[:id]}"

    puts "GroupMeetingController:send_message USER: #{current_user}"

    @message = MeetingMessage.new(text: params[:message], meeting_id: params[:id])
    @message.save

    respond_to do |format|
      format.json { render :json => @message }
    end

  end

  def get_messages

    puts "GroupMeetingController: MES: #{params[:last_message]} ID: #{params[:id]}"

    if params[:last_message] and not params[:last_message].empty?
      @messages = MeetingMessage.all().where("meeting_id = #{params[:id]} and id > #{params[:last_message]}")
      #busca a partir dessas
    else
      #busca algumas mensagens
      @messages = MeetingMessage.all().where(meeting_id: params[:id])
    end

    puts "GroupMeetingController: #{@messages}"

    if @messages.empty?
      @messages = nil
    end

    respond_to do |format|
      format.json { render :json => @messages }
    end
  
  end

end
