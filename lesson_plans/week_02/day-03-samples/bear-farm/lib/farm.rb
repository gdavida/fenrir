require "pry"

class Farm
  attr_accessor :acres, :crop, :planted, :harvest_method

  def initialize(acres:, crop:, planted:, harvest_method:)
    @acres = acres
    @crop = crop
    @planted = planted
    @harvest_method = harvest_method
  end

  def bear
    @bear
  end

  def bear=(bear)
    @bear = bear
  end

  def plant
    if @planted
      "Already planted"
    else
      @planted = true
      "Planted successfully"
    end
  end

  def harvest
    if @planted
      @planted = false
      "You harvested #{acres} acres of #{crop} by #{harvest_method}"
    else
      "You cannot harvest an unplanted field"
    end
  end
end


