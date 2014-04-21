require 'spec_helper'

describe Comment do
  it { should validate_presence_of :name }
  it { should validate_presence_of :response }
  it { should belong_to :wiki }
end
