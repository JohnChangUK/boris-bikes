require 'bike'
require 'docking_station'

describe Bike do
  it { is_expected.to respond_to :working }

# it 'can be reported broken' do
# subject.working
# expect(subject).to be_broken
#
# end
end
