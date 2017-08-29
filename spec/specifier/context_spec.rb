require 'spec_helper'

RSpec.describe Specifier::Context do
  subject(:example) { Specifier::Context.new(descriptor, &proc {}) }
end
