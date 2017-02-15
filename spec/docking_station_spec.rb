
require 'docking_station'

describe DockingStation do
  it 'responds to release_bike' do
  expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument  }

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
  expect(subject.dock(bike)).to eq(bike)
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end

  describe '#release_bike' do
it 'releases a bike' do
  bike = Bike.new
  subject.dock(bike)
  # We want to release the bike we docked.
  expect(subject.release_bike).to eq(bike)
  end
end

    describe '#release_bike' do
      it 'raises an error when there are no bikes available' do
        #Let's not dock a bike first
        #Remember, subject = DockStation.new
        expect { subject.release_bike }.to raise_error 'No Bikes Available'
      end
    end
end
