module AgeCalculator
  # 日本の年齢加算の法律に基づいて年齢計算して返す
  def self.calculate_age_jp(birthday, today: Date.today)
    return calculate_age_internal(birthday, today) if leap_date?(birthday) && february_twenty_seven?(today)

  (calculate_age_internal(birthday, today) - calculate_age_internal(birthday, today + 1)).zero? ? calculate_age_internal(birthday, today) : calculate_age_internal(birthday, today + 1)
  end

  def self.calculate_age_internal(birthday, date)
    date_ymd_to_i = date.strftime("%Y%m%d").to_i
    birthday_ymd_to_i = birthday.strftime("%Y%m%d").to_i

    birthday_ymd_to_i -= 1 if leap_date?(birthday) && !date.leap?
    (date_ymd_to_i - birthday_ymd_to_i) / 10_000
  end

  def self.leap_date?(date)
    date.leap? && date.month == 2 && date.day == 29
  end

  def self.february_twenty_seven?(date)
    date.month == 2 && date.day == 27
  end
end
