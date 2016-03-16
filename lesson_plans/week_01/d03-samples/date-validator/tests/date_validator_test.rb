require 'test_helper'
require 'date_validator'

class DateValidatorTest < Minitest::Test
  
  def test_years_lower
    result = valid_date?(1, 1, 1879)
    refute result, "January 1st, 1879 is outside the year bound"
  end

  def test_years_upper
    result = valid_date?(1, 1, 2281)
    refute result, "January 1st, 2281 is outside the year bound"
  end
  
  def test_january_1st
    result = valid_date?(1, 1, 2016)
    assert result, "January 1st, 2016 should be valid"
  end

  def test_january_0th
    result = valid_date?(1, 0, 2016)
    refute result, "January 0th should not be valid"
  end

  def test_negative_january
    result = valid_date?(1, -5, 2016)
    refute result, "Negative date January -5th should not be valid"
  end

  def test_january_31st
    result = valid_date?(1, 31, 1880)
    assert result, "January 31st, 1880 should be valid"
  end

  def test_january_32nd
    result = valid_date?(1, 32, 2016)
    refute result, "January 32nd does not exist"
  end

  def test_february_0th
    result = valid_date?(2, 0, 1880)
    refute result, "February 0th does not exist"
  end

  def test_negative_february
    result = valid_date?(2, -5, 1979)
    refute result, "February -5th does not exist"
  end

  def test_february_1st
    result = valid_date?(2, 1, 2280)
    assert result, "February 1st, 2280 should be valid"
  end

  def test_february_28th
    result = valid_date?(2, 28, 1950)
    assert result, "February 28th, 1950 should be valid"
  end
  
  def test_march_0th
    result = valid_date?(3, 0, 1880)
    refute result, "March 0th does not exist"
  end
  
  def test_negative_march
    result = valid_date?(3, -5, 1979)
    refute result, "March -5th does not exist"
  end
  
  def test_march_1st
    result = valid_date?(3, 1, 2016)
    assert result, "March 1st, 2016 should be valid"
  end

  def test_march_31st
    result = valid_date?(3, 31, 2016)
    assert result, "March 31st should be valid"
  end
  
  def test_april_0th
    result = valid_date?(4, 0, 1880)
    refute result, "April 0th does not exist"
  end
  
  def test_negative_april
    result = valid_date?(4, -5, 1979)
    refute result, "April -5th does not exist"
  end

  def test_april_1st
    result = valid_date?(4, 1, 2016)
    assert result, "April 1st should be valid"
  end

  def test_april_30th
    result = valid_date?(4, 30, 2016)
    assert result, "April 30th should be valid"
  end

  def test_may_0th
    result = valid_date?(5, 0, 1880)
    refute result, "May 0th does not exist"
  end
  
  def test_negative_may
    result = valid_date?(5, -5, 1979)
    refute result, "May -5th does not exist"
  end
  def test_may_1st
    result = valid_date?(5, 1, 2016)
    assert result, "May 1st should be valid"
  end

  def test_may_31st
    result = valid_date?(5, 31, 2016)
    assert result, "May 31st should be valid"
  end

  def test_june_0th
    result = valid_date?(6, 0, 1880)
    refute result, "June 0th does not exist"
  end
  
  def test_negative_june
    result = valid_date?(6, -5, 1979)
    refute result, "June -5th does not exist"
  end

  def test_june_1st
    result = valid_date?(6, 1, 2016)
    assert result, "June 1st should be valid"
  end

  def test_june_30th
    result = valid_date?(6, 30, 2016)
    assert result, "June 30th should be valid"
  end
  
  def test_july_0th
    result = valid_date?(7, 0, 1880)
    refute result, "July 0th does not exist"
  end
  
  def test_negative_july
    result = valid_date?(7, -5, 1979)
    refute result, "July -5th does not exist"
  end

  def test_july_1st
    result = valid_date?(7, 1, 2016)
    assert result, "July 1st should be valid"
  end

  def test_july_31st
    result = valid_date?(7, 31, 2016)
    assert result, "July 31st should be valid"
  end
  
  def test_august_0th
    result = valid_date?(8, 0, 1880)
    refute result, "August 0th does not exist"
  end
  
  def test_negative_august
    result = valid_date?(8, -5, 1979)
    refute result, "August -5th does not exist"
  end

  def test_august_1st
    result = valid_date?(8, 1, 2016)
    assert result, "August 1st should be valid"
  end

  def test_august_31st
    result = valid_date?(8, 31, 2016)
    assert result, "August 31st should be valid"
  end

  def test_september_1st
    result = valid_date?(9, 1, 2016)
    assert result, "September 1st should be valid"
  end

  def test_september_30th
    result = valid_date?(9, 30, 2016)
    assert result, "September 30th should be valid"
  end

  def test_october_1st
    result = valid_date?(10, 1, 2016)
    assert result, "October 1st should be valid"
  end

  def test_october_31st
    result = valid_date?(10, 31, 2016)
    assert result, "October 31st should be valid"
  end

  def test_november_1st
    result = valid_date?(11, 1, 2016)
    assert result, "November 1st should be valid"
  end

  def test_november_30th
    result = valid_date?(11, 30, 2016)
    assert result, "November 30th should be valid"
  end

  def test_december_1st
    result = valid_date?(12, 1, 2016)
    assert result, "December 1st should be valid"
  end

  def test_december_31st
    result = valid_date?(12, 31, 2016)
    assert result, "December 31st should be valid"
  end

  def test_leap_year
    result = valid_date?(2, 29, 2016)
    assert result, "February 29th, 2016 is a leap day"
  end

  def test_non_leap_year
    result = valid_date?(2, 29, 1900)
    refute result, "1900 was not a leap year, thus February 29th, 1900 is invalid"
  end

  def test_millenial_leap_year
    result = valid_date?(2, 29, 2000)
    assert result, "February 29th, 2000 is a leap day and valid"
  end
end
