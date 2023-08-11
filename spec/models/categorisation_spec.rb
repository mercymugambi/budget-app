require 'rails_helper'

RSpec.describe Categorisation, type: :model do
    it 'belongs to a group' do
      association = described_class.reflect_on_association(:group)
      expect(association.macro).to eq :belongs_to
    end
  
    it 'belongs to a payments_entity' do
      association = described_class.reflect_on_association(:payments_entity)
      expect(association.macro).to eq :belongs_to
    end
  end
  