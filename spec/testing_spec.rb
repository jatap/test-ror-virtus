# encoding: utf-8

require 'spec_helper'
require 'testing'

describe 'Virtus' do
  context 'given a virtus class' do
    let(:country)   { Country.new }

    describe '#attributes' do
      it 'is a collection' do
        expect(country).to respond_to :attributes
      end
    end

    describe 'each attribute' do
      it 'adds an accesor for each attribute' do
        expect(country).to respond_to :name
        expect(country).to respond_to :code
      end

      context 'type casting' do
        before :each do
          country.code = '46000'
        end
        it 'is supported' do
          expect(country.code).to eq 46000
        end
      end

      it 'admits defaults values' do
        expect(country.name).to eq 'Spain'
        expect(country.citizens).to eq 1_000_000
      end

      context 'admits hash coercions' do
        before :each do
          @language = Language.new(name: 'vasco',
                                   notes: { prefix: 'V_', suffix: '_S' })
        end

        it 'as an extra feature' do
          expect(@language.notes).to have(2).items
          expect(@language.notes).to include :prefix
          expect(@language.notes[:prefix]).to eq 'V_'
        end
      end

      context 'admits private scope' do
        let(:town) { Town.new(sn: 'REF123456') }

        it 'hides accesor as expected' do
          expect(town.sn).to be_nil
        end

        it 'thows and exception if getting access' do
          expect { town.sn = 'REF654321' }.to raise_error
        end

        it 'can be faked to get related value' do
          town.set_sn 'REF654321'
          expect(town.sn).to eq 'REF654321'
        end
      end
    end

    context 'admits embedded values' do
      let(:galaxy_name) { 'Andromeda' }

      before :each do
        country.galaxy = Galaxy.new(name: galaxy_name)
      end

      it 'simulates a defined struct/association' do
        expect(country.galaxy).to be_kind_of Galaxy
        expect(country.galaxy.name).to eq 'AndromedaGX'
      end
    end

    describe 'given a collection' do
      context 'admits member coercions' do
        before :each do
          @region = Region.new(name: 'Levante',
                               languages: [{ name: 'vasco' },
                                           { name: 'gallego' },
                                           { name: 'catalán' }])
        end

        it 'adds elements' do
          expect(@region.languages).to have(3).items
        end

        it 'respects master type' do
          expect(@region.languages).to be_kind_of Array
        end

        it 'respects element type' do
          expect(@region.languages.first).to be_kind_of Language
        end
      end

      context 'admits typed member coercions' do
        before :each do
          @new_region = Region.new(name: 'Gomera')
          @new_region.typed_languages << { name: 'silvo' }
        end

        it 'adds elements' do
          expect(@new_region.typed_languages).to have(1).items
        end

        it 'respects master type' do
          expect(@new_region.typed_languages).to be_kind_of LanguageCollection
        end

        it 'respects master type with different parameter data type' do
          @new_region.typed_languages << ['silvo']
          expect(@new_region.typed_languages).to be_kind_of LanguageCollection
        end

        it 'respects element type' do
          expect(@new_region.typed_languages.first).to be_kind_of Language
        end
      end
    end

    describe 'admits value objects' do
      context 'given an instance' do
        let(:town_a) { Town.new(name: 'Canet',  province: { name: 'Vcia.' }) }
        let(:town_b) { Town.new(name: 'Carlet', province: { name: 'Vcia.' }) }

        it 'has attributes too' do
          expect(town_a.province).to respond_to :name
        end

        it 'supports equality with other objects' do
          expect(town_a.province).to eq town_b.province
        end
      end
    end
  end

  context 'given a class with a virtus module' do
    let(:galaxy) { Galaxy.new }

    describe '#attributes' do
      it 'is a collection' do
        expect(galaxy).to respond_to :attributes
      end
    end

    context 'each attribute' do
      it 'adds an accesor for each attribute' do
        expect(galaxy.name).to eq 'LX501@65f329CP6510329GX'
      end
      context 'type casting' do
        before :each do
          galaxy.code = '46000'
        end
        it 'is supported' do
          expect(galaxy.code).to eq 46000
        end
      end
    end
  end

  context 'given a simple class' do
    let(:earth) { Earth.new }

    before :each do
      earth.extend(Virtus)
      earth.attribute :name, String
      earth.name = 'Big Ball'
    end

    it 'can dynamically extend its instance' do
      expect(earth.name).to eq 'Big Ball'
    end
  end
end
