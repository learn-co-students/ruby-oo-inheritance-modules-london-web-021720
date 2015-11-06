describe 'Kid' do 
  let(:kid) {Kid.new("Pat")}

  it 'includes the Dance module' do
    expect(kid).to be_a_kind_of(Dance)
  end

  it 'has a name' do
    expect(kid.name).to eq('Pat')  
  end

  it 'extends the MetaDancing module' do 
    expect(Kid).to be_a_kind_of(MetaDancing)
  end
end