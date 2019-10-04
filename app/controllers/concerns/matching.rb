module Matching
  extend ActiveSupport::Concern

  def matching_all
    skills_required
    who_got_the_skills
    match_datetime
    match_distance
  end

  def skills_required
    @pros = Pro.all
    @skills_required = []
    @booking.prestations.each do |presta|
      @skills_required << presta.reference
    end
  end

  def who_got_the_skills
    @skills_availlable = []
    @pro_valid = []
    @pros.each do |pro|
      @name = pro.name
      @skills_availlable.clear
      pro.prestations.each do |presta_availlable|
        @skills_availlable << presta_availlable.reference
      end
      @y = 0
      @pi = @skills_required.size
      @skills_required.each do |x|
        if @skills_availlable.include?(x)
          @y = @y + 1
        else
          @y= @y - 1
        end
      end
      if @y ==  @pi
          @pro_valid << pro.name
        end
    end
  end

  def match_datetime
    match_day
    match_hour
  end

  def match_day
    @get_pro_back_for_day_tchek = []
    @pro_day_available = []
    @pro_valid.each do |p|
      @get_pro_back_for_day_tchek << Pro.find_by(name:p)
    end
    @get_pro_back_for_day_tchek.each do |g|
      g.openning_hours.each do |a|
        if a.day == @booking.starts_at.strftime("%A").downcase
          @pro_day_available << g.name
        end
      end
    end
  end

  def match_hour
    @get_pro_back_for_hour_tchek = []
    @pro_hour_available = []
    @pro_day_available.each do |p|
      @get_pro_back_for_hour_tchek << Pro.find_by(name:p)
    end
    @get_pro_back_for_hour_tchek.each do |g|
      g.openning_hours.each do |a|
        puts'_______________________________________________a'
        puts g.name
        puts a.day
        puts a.starts_at.strftime("%H:%M")
        puts a.ends_at.strftime("%H:%M")
        @id = g.id
        if @id > 4
          @t =  @booking.starts_at.in_time_zone("Europe/Paris")
        else
          @t = @booking.starts_at
        end
        puts @t.strftime("%H:%M")
        if  @t.strftime("%H:%M").between?(a.starts_at.strftime("%H:%M"), a.ends_at.strftime("%H:%M"))
          @pro_hour_available << g.name
        end
      end
    end
    @pro_hour_available = @pro_hour_available.uniq
  end

  def match_distance
    @pro_back_for_distance_check = []
    @pro_valid_distance = []
    @pro_hour_available.each do |name|
      @pro_back_for_distance_check << Pro.find_by(name:name)
    end
    @pro_back_for_distance_check.each do |pro|
      @distance = @distance.to_i - @distance.to_i
      @pro_max_km = @pro_max_km.to_i - @pro_max_km.to_i
      @distance = Geocoder::Calculations.distance_between(@booking, pro)
      puts '___________ effective distance ___________'
      puts @distance
      @pro_max_km =  pro.max_kilometers
      puts '___________ distance accepted ___________'
      puts   @pro_max_km
        if @distance < @pro_max_km
          @pro_valid_distance << pro
        end
    end
  end
end
