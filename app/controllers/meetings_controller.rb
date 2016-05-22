class MeetingsController < ApplicationController

  def index
    puts "GroupMeetingController: GROUP: #{self.params[:id]}"


  end

  def generate

    puts "GroupMeetingController: GROUP: #{params[:id]}"

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


    @meetings = []
    if increment
      #increment = increment * Integer(periodicity_multiplier)

      puts "generate# INCREMENT_BASED"
      current_date = initial_date
      while current_date < end_date
        
        meeting = Meeting.new({date: current_date, start_time: start_time, end_time: end_time})
        meeting.save

        @meetings << meeting

        puts "generate# current_date: #{current_date}"

        current_date += increment
      end
    else
      #base no vetor de dia semana
      base_date = initial_date
      current_index = base_date.wdays

      puts "generate# WEEK_DAYS_BASED #{current_index}"

      #itera pelo vetor da semana
        #precisa posicionar a data inicial

      while base_date < end_date
        base_date += 1.week

        puts "generate# base_date: #{base_date} weekday: "
      end

    end

    
    respond_to do |format|
      #format.html
      format.json { render :json => @meetings }
    end

  end

end
