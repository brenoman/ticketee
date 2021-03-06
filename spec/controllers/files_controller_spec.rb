require 'spec_helper'

describe FilesController do
  let(:project) { Factory(:project) }
  let(:ticket) { Factory(:ticket, :project => project) }
  let(:good_user) { create_user! }
  let(:bad_user) { create_user! }
  let(:path) { Rails.root + "spec/fixtures/speed.txt" }
  let(:asset) do
    ticket.assets.create(:asset => File.open(path))
  end
  before do
    good_user.permissions.create!(:action => "view",
                                  :thing => project)
  end
end
