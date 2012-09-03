require 'webmock/rspec'
require 'capistrano/lingr'

describe Capistrano::Lingr do
  let(:configuration) { Capistrano::Configuration.new }
  subject { described_class.new configuration }
  
  before :each do
    configuration.load do |configuration|
      set :lingr_config, {
        :room_id => 'room_id',
        :bot_id  => 'bot_id',
        :secret  => 'secret'
      }
      
      set :application, 'test'
    end
    
    subject.stub(:git_user).and_return 'Hiroshi Yoshida'
  end
  
  describe '#notification' do
    before do
      @cap = Capistrano::Lingr.new(configuration)
    end
    
    it 'succeed to post' do
      #url = %r|.*lingr.com/api/room/say\?room=.*&bot=.*&text=.*&bot_verifier=.*|
      url = {
        :room => 'room_id',
        :bot  => 'bot_id',
        :text => 'test is deployed by Hiroshi Yoshida',
        :bot_verifier => 'e6681220943d0d1303b905dba26a7eecff2aeb58'
      }
      stub_request(:get, 'lingr.com/api/room/say?').with(:query => url).to_return(:body => /^\{\"status\":\"ok\"/)
      @cap.notification
    end
    
  end
  
  it { subject.send(:application).should == 'test'}
  it { subject.send(:room_id).should == 'room_id'}
  it { subject.send(:bot_id).should == 'bot_id'}
  it { subject.send(:verifier).should == 'e6681220943d0d1303b905dba26a7eecff2aeb58' }
  it { subject.send(:git_user).should == 'Hiroshi Yoshida'}
  it { subject.send(:text).should == 'test is deployed by Hiroshi Yoshida' }
  #http://lingr.com/api/room/say?room=room_id&bot=bot_id&text=test%20is%20deployed%20by%20Hiroshi%20Yoshida&bot_verifier=e6681220943d0d1303b905dba26a7eecff2aeb58
end