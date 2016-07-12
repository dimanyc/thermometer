class Thermometer
  attr_accessor :current_temperature, :desired_temperature, :fans_state

  def initialize
    @fans_state = 'off'
  end

  def store_current_temperature(temperature)
    @current_temperature = temperature
  end

  def store_desired_temperature(temperature)
    @desired_temperature = temperature
  end

  def adjust_temperature
    case current_climate_report
    when 'hot'
      decrease_temperature
    when 'cold'
      increase_temperature
    when 'normal'
      @fans_state = 'off'
    end
  end

  def check_climate_status
    loop do
      adjust_temperature
      sleep(30*60)
    end
  end

  private

  def current_climate_report
    if @current_temperature > @desired_temperature
      'hot'
    elsif @current_temperature < @desired_temperature
      'cold'
    else
      'normal'
    end
  end

  def decrease_temperature
    unless @fans_state == 'cooling'
      @fans_state = 'cooling'
    end
  end

  def increase_temperature
    unless @fans_state == 'heating'
      @fans_state = 'heating'
    end
  end

end
