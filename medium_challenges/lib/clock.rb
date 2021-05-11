=begin
-----------------------INSTRUCTIONS--------------------------------------
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time
represented by a given clock object. Two clock objects that represent the
same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic
operations.
--------------------------PROBLEM----------------------------------------

Questions:

Input: an integer

Output: integer as time

---------------------------RULES-----------------------------------------
Explicit:no built in date or time functionality

Implicit:

--------------------------EXAMPLES---------------------------------------
(8) -> 08:00
(10) + 3 -> 10:03
(11, 9) -> 11:09
(0) - 50 -> 23:10
  shows that 0 == 24:00||00:00

----------------------------ALGO----------------------------------------
is a CLASS method
  + and - operators
=end
class Clock
  attr_accessor :hour, :minutes

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.to_s
    @@instance.to_s
  end

  def ==(other)
    to_s == other.to_s
  end

  def self.at(hour, minutes=0)
    @@instance = Clock.new(hour, minutes)
  end

  def self.-(new_minutes)
    @@instance - (new_minutes)
  end

  def self.+(new_minutes)
    @@instance + (new_minutes)
  end

  def +(new_minutes)
    @minutes += new_minutes
    while @minutes >= 60
      @hour += 1
      if @hour >= 24
        @hour = 0
      end
      @minutes -= 60
    end
    @@instance
  end

  def -(new_minutes)
    @minutes -= new_minutes
    while @minutes <= 0
      if @hour <= 0
        @hour = 24
      end
      @hour -= 1
      @minutes += 60
    end
    @@instance
  end

  def hour_format(hour)
    if hour.chars.length == 2
      hour
    else
      '0' + hour
    end
  end

  def minute_format(minutes)
    if minutes.chars.length == 2
      minutes
    else
      '0' + minutes
    end
  end

  def to_s
    result = []
    hour = @hour.to_s
    minutes = @minutes.to_s
    result << hour_format(hour)
    result << minute_format(minutes)
    result.join(':')
  end
end
