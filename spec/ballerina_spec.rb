describe 'Ballerina' do 
  let(:ballerina) {Ballerina.new('Anna')}

  it 'includes the Dance module' do
    expect(ballerina).to be_a_kind_of(Dance)
  end

  it 'has a name' do
    expect(ballerina.name).to eq('Anna')  
  end

  it 'extends the MetaDancing module' do 
    expect(Ballerina).to be_a_kind_of(MetaDancing)
  end
end