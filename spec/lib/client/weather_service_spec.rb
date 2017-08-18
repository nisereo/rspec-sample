require "spec_helper"

describe 'Client::WeatherService' do
  describe '#weather' do
    let(:client) { Client::WeatherService }
    before do
      weather_service_client = double('Weather service client')
      allow(weather_service_client).to receive(:weather).and_return('晴れです')
      allow(client).to receive(:new).and_return(weather_service_client)
    end
    it '晴れが返ること' do
      expect(client.weather('tokyo')).to eq '晴れです'
    end
  end
end
