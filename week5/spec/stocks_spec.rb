require 'stocks'

RSpec.describe StockPickService do
  it 'shows days of profit' do
    expect(StockPickService.new([1, 2, 3]).call).to eq([0, 2])
  end
  it 'shows days of profit' do
    expect(StockPickService.new([1, 2, 3, 5, 6, 5, 9, 1, 2, 4, 5, 4]).call).to eq([0, 6])
  end
  it 'says i need array' do
    expect(StockPickService.new({}).call).to eq('i need array')
  end
  it 'says no way for benifit' do
    expect(StockPickService.new([3, 3, 3, 3, 3, 3]).call).to eq('no way for benifit')
  end
  it 'says no way for benifit' do
    expect(StockPickService.new([3]).call).to eq('no way for benifit')
  end
  it 'says no way for benifit' do
    expect(StockPickService.new([3, 1]).call).to eq('no way for benifit')
  end
  it 'says all parameters must be numbers' do
    expect(StockPickService.new([3, '1']).call).to eq('all parameters must be numbers')
  end
  it 'says all parameters must be numbers' do
    expect(StockPickService.new(%w[jkasmnd 1]).call).to eq('all parameters must be numbers')
  end
end


