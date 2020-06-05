require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday_name, supply_array|
        supply_array << supply
      end    
    end  
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, seasons_holidays|
    if season == :spring
      seasons_holidays.each do |holiday, supply_array|
        supply_array << supply  
      end  
    end 
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supply_array = []
  holiday_hash.each do |season, season_holiday_hash|
    if season == :winter
      season_holiday_hash.each do |holiday, supply_array|
        winter_supply_array << supply_array
      end  
    end 
  end 
  winter_supply_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, season_holiday_hash|
    season_string = season.to_s
    season_string.capitalize!
    puts season_string + ":"
    season_holiday_hash.each do |holiday, supply_array|
      holiday_string = holiday.to_s
      holiday_string_array = holiday_string.split(/_/)
      holiday_string_array.each do |word| 
        word.capitalize!
      end
      holiday_string = holiday_string_array.join(" ")
      supply_string = supply_array.join(", ")
      puts "  " + holiday_string + ": " + supply_string
    end
  end
end

holiday_supplies = {
  :winter => {
    :christmas_day => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_collection_array = []
  holiday_hash.each do |season, season_holiday_hash|
    season_holiday_hash.each do |holiday, supply_array|
      supply_array.each do |supply|
        if supply == "BBQ"
          bbq_collection_array << holiday
        end
      end
    end
  end
  bbq_collection_array
end







