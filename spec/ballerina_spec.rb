describe 'Ballerina' do
  let(:ballerina) {Ballerina.new('Anna')}

  it 'includes the Dance module' do
    expect(ballerina).to have_instance_dance_methods
  end

  it 'has a name' do
    expect(ballerina.name).to eq('Anna')
  end

  it 'extends the MetaDancing module' do
    expect(Ballerina).to have_class_dance_methods
  end
end
