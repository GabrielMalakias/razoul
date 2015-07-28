require 'spec_helper'

RSpec.describe Razoul::Token do
  before do
    Timecop.freeze(Time.now)
  end

  after do
    Timecop.return
  end

  let(:time_in_seconds) { Time.now.to_i }
  before :each do
    Razoul.configure do |config|
      config.login = 'Razoul'
      config.password = 'Razoul_AUTH'
    end
  end

  describe '#new' do
    subject { described_class.new } 
    its(:created_at)   { is_expected.to eq time_in_seconds }
    its(:'value.size') { is_expected.to eq 64 }
  end
end