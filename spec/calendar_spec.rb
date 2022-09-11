require 'rails_helper'

describe Calendar do
    describe '#output_calendar' do
        it "prints something" do
            @calendar = Calendar.new
            expect(@calendar.output_calendar.is_a? String).to eq(true)
        end

        it "outputs the current month correctly"
        it "outputs a random month and year correctly"
        it "outputs another random month and year correctly"
    end
end
