
require 'docking_station'

describe DockingStation do

  let(:bike) { Bike.new }
  # let(:bike) { double :bike }
  # let(:bike2) { double :bike }

  it 'responds to release_bike' do
  expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument  }

  it { is_expected.to respond_to(:bike_station) }

  it 'docks something' do
  expect(subject.dock(bike)).to eq([bike])
  end

  it 'returns docked bikes' do
    subject.dock(bike)
    expect(subject.bike_station).to eq([bike])
  end

  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(@bike)
      expect(subject.release_bike).to eq(@bike)
    end
  end

  describe '#release_bike' do
    it 'raises an exception/error when no bikes available' do
      #We are not going to dock a bike first,
      #remember, subject = DockingStation.new
      expect { subject.release_bike}.to raise_error 'No bikes left'
    end
  end

  describe 'Check if Bike is an array' do
  it 'checks if an array has been created for bikes' do
    expect(subject.bike_station).to be_kind_of(Array)
  end
end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect {subject.dock([Bike.new]) }.to raise_error 'Station is full'
end

  it 'adds a new bike to the end of the array' do
    subject.dock(bike)
    expect(subject.bike_station[-1]).to eq(bike)
  end

end

it 'sets capacity to default if it was not specified' do
  expect(subject.capacity).to eq DockingStation::CAPACITY
end

  describe '#capacity' do
    context 'without arguments'
    it 'Should use the default value 20' do
      station = DockingStation.new(20)
      expect(subject.capacity).to eq(20)
    end
end

  context 'with arguments' do
    it 'should set the capacity to 30' do
      station = DockingStation.new(30)
      #Now, we are testing to see if we can change the capacity value
      station.capacity = 50
      expect(station.capacity).to eq(50)
    end
  end


  it 'raises an error when no more working bikes' do
    expect { subject.pop_working_bike }.to raise_error 'No more working bikes'
  end

  it 'testing that release_bike will return a working bike' do
    bike = double(Bike.new)
    bike2 = double(Bike.new)
    allow(bike).to receive(:working).and_return(true)
    allow(bike2).to receive(:working).and_return(false)

    subject.dock(bike)
    subject.dock(bike)
    subject.dock(bike2)
    subject.dock(bike2)

    expect(subject.broken_bikes.pop.working).to eq(false)
  end

end
