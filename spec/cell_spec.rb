require 'spec_helper'

describe "game of life" do
  context "citizen" do
    subject { Cell.new }

    before(:each) do
      @cell = subject.spawn
    end

    it "is alive when spawned" do
      @cell.state.should == 'alive'
    end
  end

  context "neighbourhoods" do
    subject { Neighbourhood.new resident: "me", population: ["me", "you"] }

    it "has the resident and population" do
      @neighbourhood = subject
      @neighbourhood.resident.should == "me"
      @neighbourhood.population.should == ["me", "you"]
    end
  end

  context "world" do
      let(:x) { 5 }
      let(:y) { 3 }

    before(:each) do
      @world = World.new x: x, y: y
    end
    it "has a citizen at every coordinate" do
      x.times do |a|
        y.times do |b|
          expect(@world.cells.any? { |cell|
            cell[:coordinates] == [a, b]
          }).to be true
        end
      end
    end
  end


end

