require 'spec_helper'

describe Capistrano::Lingr do
  let(:configuration) { Capistrano::Configuration.new }
  subject { described_class.new configuration }

  before(:each) do
    configuration.load do |configuration|
      set :lingr_config, {
        room_id: 'room_id',
        bot_id:  'bot_id',
        secret:  'secret',
        text: 'DEPLOY DONE'
      }
      set :application, 'test'
    end
    subject.stub(:git_user).and_return 'Hiroshi Yoshida'
  end

  describe '#notification' do
    let(:cap) { Capistrano::Lingr.new(configuration) }
    before do
      url = {
        room:         'room_id',
        bot:          'bot_id',
        text:         'DEPLOY DONE',
        bot_verifier: 'e6681220943d0d1303b905dba26a7eecff2aeb58'
      }
      stub_request(:get, 'lingr.com/api/room/say?').
        with(query: url).
        to_return(body: "{\"status\":\"ok\"}")
    end

    it 'succeed to post' do
      responce = cap.notification
      responce.body.should eq("{\"status\":\"ok\"}")
    end
  end

  describe 'private methods' do
    it { subject.send(:application).should == 'test'}
    it { subject.send(:room_id).should == 'room_id'}
    it { subject.send(:bot_id).should == 'bot_id'}
    it { subject.send(:verifier).should == 'e6681220943d0d1303b905dba26a7eecff2aeb58' }
    it { subject.send(:git_user).should == 'Hiroshi Yoshida'}
    it { subject.send(:text).should == 'DEPLOY DONE' }
  end
end
