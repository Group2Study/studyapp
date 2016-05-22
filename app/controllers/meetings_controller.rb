class MeetingsController < ApplicationController

  def index
    puts "GroupMeetingController:index# GROUP: #{self.params[:id]}"

    @group_id = params[:id]


  end

  def list
    puts "GroupMeetingController:list# GROUP: #{params[:id]}"

    @meetings = Meeting.all().where(group_id: params[:id]).order(:date)

    respond_to do |format|
      #format.html
      format.json { render :json => @meetings }
    end

  end

  def generate

    puts "GroupMeetingController:generate# GROUP: #{params[:group_id]}"

    group_id = params[:group_id]

    initial_date = Date.parse(params['initial_date']) 
    end_date = Date.parse(params['end_date'])

    start_time = Time.parse(params['start_time'])
    
    unless params['end_time'].empty?
      end_time = Time.parse(params['end_time'])
    end

    puts "generate ID: #{initial_date} ED: #{end_date} ST: #{start_time} ET: #{end_time}"

    periodicity = params['periodicity']
    periodicity_multiplier = Integer(params['multiplier'])


    #gerar o meetings para o group entre as data
    increment = (1 * periodicity_multiplier).days

    if periodicity == "dia_semana"
      increment = nil
      #precisa gerar os events para cada dia de semana
        #pode ter caso de ter alguns dias de semana?
        #pode ter um array das semanas!
    elsif periodicity == "semana"
      increment = (1 * periodicity_multiplier).week
    
    elsif periodicity == "mes"
      increment = (1 * periodicity_multiplier).month
      
    elsif periodicity == "ano"
      increment = (1 * periodicity_multiplier).year
    end

     puts "generate INC: #{increment} MUL: #{periodicity_multiplier}"


  
    if increment
      #increment = increment * Integer(periodicity_multiplier)

      puts "generate# INCREMENT_BASED"
      current_date = initial_date
      while current_date < end_date
        
        meeting = Meeting.new({date: current_date, start_time: start_time, end_time: end_time, group_id: group_id})
        meeting.save

        #@meetings << meeting

        puts "generate# current_date: #{current_date}"

        current_date += increment
      end
    else
      #base no vetor de dia semana
      base_date = initial_date
      current_index = Integer(base_date.strftime("%w"))

      week_days = params[:week_days]
      

      puts "generate# WEEK_DAYS_BASED #{current_index} week_days: #{week_days}"


      #itera pelo vetor da semana
        #precisa posicionar a data inicial

      while base_date < end_date

        current_date = base_date

        (current_index..6).each do |week_day_index|

          puts "generate# DATE: #{current_date} D: #{week_day_index} V: #{week_days[week_day_index]}" 
          if week_days[week_day_index] == 'true'
            meeting = Meeting.new({date: current_date, start_time: start_time, end_time: end_time, group_id: group_id})
            meeting.save
          end
          current_date += 1.day
        end
        current_index = 0
        base_date = base_date.beginning_of_week

        puts "generate# ANTES) base_date: #{base_date} weekday: #{base_date.strftime("%w")}"

        base_date += 1.week

        puts "generate# DEPOIS) base_date: #{base_date} weekday: #{base_date.strftime("%w")}"

       
      end

    end

    @meetings = Meeting.all().where(group_id: params[:group_id]).order(:date)

    puts "generate# #{@meetings}"

    respond_to do |format|
      #format.html
      format.json { render :json => @meetings }
    end

  end

end
