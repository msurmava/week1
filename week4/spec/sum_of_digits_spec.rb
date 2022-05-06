require 'sum_of_digits'

RSpec.describe SumOfDigitsService do
  it 'returns sum' do
    expect(SumOfDigitsService.new(1, 7).call).to eq(28)
  end
  it 'returns sum' do
    expect(SumOfDigitsService.new(1, 4).call).to eq(10)
  end
  it 'returns sum' do
    expect(SumOfDigitsService.new(4, 1).call).to eq(10)
  end
  it 'returns validation violation' do
    expect(SumOfDigitsService.new(1, 4, 4).call).to eq('Please, enter numbers!')
  end
  it 'detects validation violation' do
    expect(SumOfDigitsService.new('1', 4).call).to eq('Please, enter numbers!')
  end
  it 'detects validation violation' do
    expect(SumOfDigitsService.new('1', 4).call).to eq('Please, enter numbers!')
  end
  it 'detects validation violation' do
    expect(SumOfDigitsService.new(['1', 4]).call).to eq('Please, enter numbers!')
  end
  it 'detects validation violation' do
    expect(SumOfDigitsService.new([]).call).to eq('Please, enter numbers!')
  end
  it 'detects validation violation' do
    expect(SumOfDigitsService.new().call).to eq('Please, enter numbers!')
  end
end
