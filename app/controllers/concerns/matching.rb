module Matching
  extend ActiveSupport::Concern

  def find_pro
    matching_all
    find
  end

  def matching_all
    @pros = Pro.all
    skills_required
    who_got_the_skills
    match_datetime
    match_distance
  end

  def skills_required
    @skills_required = Array.new
    @booking.prestations.each { |presta| @skills_required << presta.reference }
  end

  def who_got_the_skills
    skills_availlable = Array.new
    @pro_valid = Array.new
    @pros.each do |pro|
      @name = pro.name
      skills_availlable.clear
      pro.prestations.each { |presta_availlable| skills_availlable << presta_availlable.reference }
      number_of_skills_of_the_pro = 0
      @skills_required.each { |skill_required| number_of_skills_of_the_pro += 1  if skills_availlable.include?(skill_required) }
      @pro_valid << pro.name if number_of_skills_of_the_pro ==  @skills_required.size
    end
  end

  def match_datetime
    match_day
    match_hour
  end

  def match_day
    @pro_day_available = Array.new
    @pros.each { |pro| pro.openning_hours.each { |opening| @pro_day_available << pro if opening.day == @booking.starts_at.strftime("%A").downcase } }
  end

  def match_hour
    pro_hour_available = Array.new
    @pro_day_available.each do |pro|
      pro.openning_hours.each do |hour|
        id = pro.id
        if id > 4
          time_desired =  @booking.starts_at.in_time_zone("Europe/Paris")
        else
          time_desired = @booking.starts_at
        end
        pro_hour_available << pro.name if time_desired.strftime("%H:%M").between?(hour.starts_at.strftime("%H:%M"), hour.ends_at.strftime("%H:%M"))
      end
    end
    @pro_day_and_hour_available = pro_hour_available.uniq
  end

  def match_distance
    @pro_valid_distance = Array.new
    @pros.each do |pro|
      @distance = Geocoder::Calculations.distance_between(@booking, pro)
      @pro_valid_distance << pro.name if @distance < pro.max_kilometers
    end
  end

  def find
    @final_find = Array.new
    @pros.each { |pro| @final_find << pro.name if  @pro_valid_distance.include?(pro.name) && @pro_valid.include?(pro.name) && @pro_day_and_hour_available.include?(pro.name) }
  end
end
