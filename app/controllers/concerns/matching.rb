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
        @t =  @booking.starts_at + 2*60*60
        @u= @t.strftime("%B %d, %Y %H:%M'")
        puts" ____________________________________________  "
        puts @t
        puts @u
        if  @t.strftime("%I:%M%p").between?(a.starts_at.strftime("%I:%M%p"), a.ends_at.strftime("%I:%M%p"))
          @pro_hour_available << g.name
        end
      end
    end
  end

  def match_distance
    @pro_back_for_distance_check = []
    @pro_valid_distance = []
    @pro_hour_available.each do |name|
      @pro_back_for_distance_check << Pro.find_by(name:name)
    end
    @pro_back_for_distance_check.each do |pro|
      '_____________________________________________real distance and max km'
      @distance = Geocoder::Calculations.distance_between(@booking, pro)
      puts @distance
      @pro_max_km =  pro.max_kilometers
        if @distance < @pro_max_km
          @pro_valid_distance << pro
        end
    end
    puts '__________________________________________________the array'
    puts @pro_valid_distance.inspect
  end

end
