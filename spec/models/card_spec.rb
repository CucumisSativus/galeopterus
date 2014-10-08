require 'rails_helper'

describe Card do
  it { should respond_to(:title) }
  it { should respond_to(:description) }
end
