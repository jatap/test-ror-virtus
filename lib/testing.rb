require 'json'

# Univers
#
# @author julio.antunez.tarin@gmail.com
module Univers
  include Virtus

  attribute :name, String, default: 'LX501@65f329CP6510329'
end

# Galaxy
#
# @author julio.antunez.tarin@gmail.com
class Galaxy
  include Univers

  attribute :code, Integer

  # Name accesor
  #
  # @return [String] the name
  def name
    super + 'GX'
  end
end

# Country
#
# @author julio.antunez.tarin@gmail.com
class Country
  include Virtus

  attribute :name,     String, default: 'Spain'
  attribute :code,     Integer
  attribute :citizens, Integer, default: :calculate_citizens
  attribute :galaxy,   Galaxy

  # Calculate citizens
  #
  # @return [FixNum] the number or citizens
  def calculate_citizens
    1_000_000 if defined? :attributes
  end
end

# Earth
#
# @author julio.antunez.tarin@gmail.com
class Earth
end

# Language
#
# @author julio.antunez.tarin@gmail.com
class Language
  include Virtus

  attribute :name,  String
  attribute :notes, Hash[Symbol => String]
end

# LanguageCollection
#
# @author julio.antunez.tarin@gmail.com
class LanguageCollection < Array
  # Array push
  #
  # @return [Array] the array
  def <<(language)
    if language.kind_of?(Hash)
      super(Language.new(language))
      self
    else
      super
    end
  end
end

# Region
#
# @author julio.antunez.tarin@gmail.com
class Region
  include Virtus

  attribute :name,            String
  attribute :languages,       Array[Language]
  attribute :typed_languages, LanguageCollection[Language],
                              default: LanguageCollection.new
end

# Province
#
# @author julio.antunez.tarin@gmail.com
class Province
  include Virtus::ValueObject

  attribute :name, String
end

# Town
#
# @author julio.antunez.tarin@gmail.com
class Town
  include Virtus

  attribute :name,     String
  attribute :province, Province
  attribute :sn,       String, writer: :private

  # Set serial number
  #
  # return [void]
  def set_sn(sn)
    self.sn = sn
  end
end


