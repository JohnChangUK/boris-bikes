
require 'docking_station'

describe DockingStation do

  let(:bike) { Bike.new }

  it 'responds to release_bike' do
  expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument  }

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
  expect(subject.dock(bike)).to eq([bike])
  end

  it 'returns docked bikes' do
    subject.dock(bike)
    expect(subject.bike).to eq([bike])
  end

  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end
  end

  describe '#release_bike' do
    it 'raises an exception/error when no bikes available' do
      #We are not going to dock a bike first,
      #remember, subject = DockingStation.new
      expect { subject.release_bike}.to raise_error 'No bikes left'
    end
  end


  describe '#dock' do
    it 'raises an error when full' do
      20.times { subject.dock Bike.new }
      expect {subject.dock([Bike.new]) }.to raise_error 'Station is full'
end
end

end
