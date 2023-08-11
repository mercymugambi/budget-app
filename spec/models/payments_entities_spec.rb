require 'rails_helper'

RSpec.describe PaymentsEntity, type: :model do
    it 'belongs to a user with foreign key author_id' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
      expect(association.options[:foreign_key]).to eq 'author_id'
    end
  
    it 'has many categorisations' do
      association = described_class.reflect_on_association(:categorisations)
      expect(association.macro).to eq :has_many
    end
  
    it 'has many groups through categorisations' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :categorisations
    end
  end
  