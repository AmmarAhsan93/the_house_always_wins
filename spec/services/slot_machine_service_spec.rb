# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlotMachineService, type: :service do
  let(:user) { User.new(credits: 10) }
  let(:service) { described_class.new(user) }

  describe '#roll' do
    it 'returns an array of symbols' do
      result, = service.roll
      expect(result).to be_an(Array)
      expect(result.all? { |symbol| symbol.is_a?(String) }).to be true
    end

    it 'returns credits based on the winning roll' do
      allow_any_instance_of(SlotMachineService).to receive(:calculate_credits).and_return(10)
      _result, credits = service.roll
      expect(credits).to eq(10)
    end

    it 'returns credits of -1 for a losing roll' do
      allow_any_instance_of(SlotMachineService).to receive(:calculate_credits).and_return(-1)
      _result, credits = service.roll
      expect(credits).to eq(-1)
    end
  end
end
