# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Personas::RoutablePersonas do
  let(:routable)     { 'test' }
  let(:unroutable)   { 'unrouteable' }
  let(:test_persona) { build_persona(routable) }

  describe '.find' do
    subject { described_class }

    let!(:routable_personas) do
      {
        "personas::#{routable}" => test_persona
      }
    end

    before do
      allow(Personas::Base)
        .to receive(:routable_personas)
        .and_return(routable_personas)
    end

    it 'returns persona matching name' do
      expect(subject.find('test')).to eq test_persona
    end

    context 'with no matching persona' do
      it 'raises an exception' do
        expect { subject.find(unroutable) }
          .to raise_exception Personas::RoutablePersonas::UnroutablePersona
      end
    end
  end

  describe '.routable?' do
    subject { described_class }

    context 'with supported persona' do
      specify { expect(subject).to be_routable('test') }
    end

    context 'with non-supported persona' do
      specify { expect(subject).not_to be_routable(unroutable) }
    end
  end
end
