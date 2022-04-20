require 'bubblesort'

RSpec.describe BublesortService do
  it 'returns sorted array of numbers' do
    expect(BublesortService.new(%w[1 5 3]).call).to eq([1, 3, 5])
  end
  it 'returns sorted array of numbers' do
    expect(BublesortService.new(['1']).call).to eq([1])
  end
  it 'returns sorted array of numbers' do
    expect(BublesortService.new(['1', 1, 1]).call).to eq([1, 1, 1])
  end
  it 'returns sorted array of numbers' do
    expect(BublesortService.new(%w[11 45 785]).call).to eq([11, 45, 785])
  end

  it 'returns sorted array of numbers' do
    expect(BublesortService.new([11, 45, 785]).call).to eq([11, 45, 785])
  end
  it 'returns sorted array of numbers' do
    expect(BublesortService.new.call).to eq('please give me an array of numbers')
  end
  it 'returns sorted array of numbers' do
    expect(BublesortService.new(%w[45 sda45 785]).call).to eq('please give me an array of numbers')
  end
end


