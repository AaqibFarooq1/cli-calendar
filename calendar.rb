require 'date'
require 'time'

class Calendar
    def initialize
        @time = Time.new
        @week = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
        @month = ARGV[1].nil? ? @time.strftime("%B") : Date::MONTHNAMES[ARGV[1].to_i]
        @year = ARGV[2].nil? ? @time.strftime("%Y") : ARGV[2]
        @calendar = []
    end

    def days_in_month
        dates = (1..(Date.new(@year.to_i, @time.strftime("%m").to_i, -1).day)).to_a
        (0..8).each do |d|
            dates[d] = dates[d].to_s.rjust(2, "0")
        end
        dates
    end

    def first_day_of_month_index
        @week.index(Time.parse("1 of #{@month} #{@year.to_i}").strftime("%A")[0,2])
    end

    def output_calendar
        puts "    #{@month} #{@year}"
        puts @week.join(' ')

        first_day_of_month_index.times { |n| @calendar << '  ' }
        @calendar << days_in_month
        @calendar.flatten!

        while @calendar.any? do
            @date_row = []
            @calendar[0,7].each { |cal| @date_row << cal }
            puts @date_row.join(' ')
            @calendar = @calendar.drop(7)
        end
    end
end

if ARGV[0]=='cal'
    calendar = Calendar.new
    puts calendar.output_calendar
end
