require 'rails_helper'

describe ApiConstraints do
  let(:api_constraints_v1) { ApiConstraints.new(version: 1) }
  let(:api_constraints_v2) { ApiConstraints.new(version: 2, default: true) }

  describe "matches?" do

    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.jobhunt.dev',
                       headers: {"Accept" => "application/vnd.jobhunt.v1+json"})
      expect(api_constraints_v1.matches?(request)).to be_truthy
    end

    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.jobhunt.dev')
      expect(api_constraints_v2.matches?(request)).to be_truthy
    end
  end
end
