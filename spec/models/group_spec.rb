require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq :belongs_to
  end

  it 'has many categorisations' do
    association = described_class.reflect_on_association(:categorisations)
    expect(association.macro).to eq :has_many
  end

  it 'has many payments_entities through categorisations' do
    association = described_class.reflect_on_association(:payments_entities)
    expect(association.macro).to eq :has_many
    expect(association.options[:through]).to eq :categorisations
  end

  it 'has one attached icon' do
    expect(described_class.new.icon).to be_an_instance_of(ActiveStorage::Attached::One)
  end

  it 'validates presence of name' do
    group = described_class.new
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end
end
