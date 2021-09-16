# frozen_string_literal: true

RSpec.describe ShinerRubyCommonExt do
  describe 'Hash' do
    let(:h) { { :a => nil, :b => false, :c => '', :d => [], :e => {} } }

    describe '#compact_blank' do
      it 'delete blank value but not change itself' do
        expect(h.compact_blank).to eq({})
        expect(h.present?).to be true
      end
    end

    describe '#compact_blank!' do
      it 'delete blank value abd change itself' do
        h.compact_blank!
        expect(h).to eq({})
      end
    end
  end
end
