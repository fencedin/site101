require 'spec_helper'

describe Wiki do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should have_and_belong_to_many :tags }
  it { should have_many :comments }
end
