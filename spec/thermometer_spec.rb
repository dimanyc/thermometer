require 'spec_helper'
require_relative '../lib/thermometer'

describe Thermometer do

  let(:thermometer) { Thermometer.new }

  it 'stores current temperature' do
    expect(subject.store_current_temperature(333)).to eq(subject.current_temperature)
  end

  it 'stores desired temperature' do
    expect(subject.store_desired_temperature(333)).to eq(subject.desired_temperature)
  end

  context 'temperature control' do

    before(:each) do
      allow(subject).to receive(:loop).and_yield
    end

    it 'checks current temperature every 30 minutes' do
      subject.current_temperature = rand(0...9)
      subject.desired_temperature = rand(0...9)
      expect(subject).to receive(:sleep).with(30*60)
      subject.check_climate_status
    end

    it 'activates cooling when current temperature is higher than desired temperature' do
      subject.current_temperature = 2
      subject.desired_temperature = 1
      expect(subject).to receive(:decrease_temperature)
      subject.adjust_temperature
    end

    it 'activates heating when current temperature is lower than desired temperature' do
      subject.current_temperature = 1
      subject.desired_temperature = 2
      expect(subject).to receive(:increase_temperature)
      subject.adjust_temperature
    end

    it 'shuts off climate adjustment when current temperature is equal to desired temperature' do
      subject.current_temperature = 1
      subject.desired_temperature = 1
      expect(subject.fans_state).to eq('off')
      subject.adjust_temperature
    end

  end

end
