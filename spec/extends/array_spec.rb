# frozen_string_literal: true

RSpec.describe ShinerRubyCommonExt do
  describe 'Array' do
    let(:a) { ['', false, nil, ' ', 0, true] }

    describe '#compact_blank' do
      it 'delete blank value but bot change itself' do
        expect(a.compact_blank).to eq([0, true])
        expect(a).to eq(['', false, nil, ' ', 0, true])
      end
    end

    describe '#compact_blank!' do
      it 'delete blank value and change itself' do
        a.compact_blank!
        expect(a).to eq([0, true])
      end
    end
  end
end
