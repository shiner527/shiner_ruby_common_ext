# frozen_string_literal: true

RSpec.describe ShinerRubyCommonExt do
  describe 'TimeInstance' do
    describe '#format_date' do
      let(:time) { Time.local(2021, 5, 19, 12, 13, 14) }

      it 'default with no args' do
        expect(time.format_date).to eq('2021-05-19')
      end

      it 'argu is :full' do
        expect(time.format_date(:full)).to eq('2021-05-19 12:13:14')
      end

      it 'arg is :min' do
        expect(time.format_date(:min)).to eq('2021-05-19 12:13')
      end

      it 'rag is :date' do
        expect(time.format_date(:date)).to eq('2021-05-19')
      end

      it 'arg is :year' do
        expect(time.format_date(:year)).to eq('2021')
      end
    end
  end
end
