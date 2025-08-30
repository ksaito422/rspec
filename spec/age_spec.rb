require 'date'
require 'rspec-parameterized'
require_relative '../age_calculator'

RSpec.describe AgeCalculator do
  describe ".calculate_age_jp" do
    context "基本的なケース" do
      where(:birthday_s, :date_s, :expected_age, :description) do
        [
          ["2000-01-01", "2020-12-30", 20, "誕生日2日前"],
          ["2000-01-01", "2020-12-31", 21, "年を取る日"],
          ["2000-01-01", "2021-01-01", 21, "誕生日"],
          ["2000-01-01", "2021-01-02", 21, "誕生日翌日"],
        ]
      end

      with_them do
        it "#{birthday_s}生まれは#{date_s}時点で#{expected_age}歳 (#{description})" do
          birthday = Date.parse(birthday_s)
          date = Date.parse(date_s)
          expect(AgeCalculator.calculate_age_jp(birthday, today: date)).to eq(expected_age)
        end
      end
    end

    context "うるう日生まれのケース" do
      where(:birthday_s, :date_s, :expected_age, :description) do
        [
          ["2000-02-29", "2021-02-27", 20, "年を取る前日"],
          ["2000-02-29", "2021-02-28", 21, "年を取る日(2/28)"],
          ["2000-02-29", "2021-03-01", 21, "年を取った翌日"],
          ["2000-02-29", "2020-02-28", 20, "うるう年の前日"],
          ["2000-02-29", "2020-02-29", 20, "うるう年の誕生日"],
        ]
      end

      with_them do
        it "#{birthday_s}生まれは#{date_s}時点で#{expected_age}歳 (#{description})" do
          birthday = Date.parse(birthday_s)
          date = Date.parse(date_s)
          expect(AgeCalculator.calculate_age_jp(birthday, today: date)).to eq(expected_age)
        end
      end
    end

    context "3月1日生まれのケース" do
      where(:birthday_s, :date_s, :expected_age, :description) do
        [
          ["2000-03-01", "2020-02-28", 19, "誕生日2日前"],
          ["2000-03-01", "2020-02-29", 20, "誕生日前日"],
          ["2000-03-01", "2020-03-01", 20, "誕生日"],
        ]
      end

      with_them do
        it "#{birthday_s}生まれは#{date_s}時点で#{expected_age}歳 (#{description})" do
          birthday = Date.parse(birthday_s)
          date = Date.parse(date_s)
          expect(AgeCalculator.calculate_age_jp(birthday, today: date)).to eq(expected_age)
        end
      end
    end
  end
end
