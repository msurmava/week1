require 'bubblesort'

RSpec.describe BublesortService do
  it 'returns sorted array of integers' do
    expect(BublesortService.new([1,5,3]).call).to eq([1, 3, 5])
  end
  it 'returns self when one element given' do
    expect(BublesortService.new(['1']).call).to eq(['1'])
  end
  it 'returns sorted array of float numbers' do
    expect(BublesortService.new([1.5, 1.1, 1.6]).call).to eq([1.1, 1.5, 1.6])
  end
  it 'returns sorted array of stirngs' do
    expect(BublesortService.new(%w[hello my friend]).call).to eq(["friend", "hello", "my"])
  end

  it 'raises an exception when not same type of data' do
    expect(BublesortService.new([11.5, 45, 785]).call).to eq('Invalid Input')
  end
  it 'raises an exception when empty' do
    expect(BublesortService.new.call).to eq('Invalid Input')
  end
  it 'raises an exception when not same type of data' do
    expect(BublesortService.new([45, "sda45", 785]).call).to eq('Invalid Input')
  end
  it 'raises an exception when array not given' do
    expect(BublesortService.new({:hi => "there"}).call).to eq('Invalid Input')
  end

end


