require 'spec_helper'

describe "game of life" do
  context "cells" do
    subject { Cell.new }

    before(:each) do
      @cell = subject.spawn_at(a: 3, b: 5)
    end

    it "spawns at the correct coodinates" do
      @cell.coordinates.should == {a: 3, b: 5}
    end
    it "is alive when spawned" do
      @cell.state.should == 'alive'
    end

  end
end