require 'spec_helper'
require 'my_gem/bibliog'

describe Bibliografia do
    before :each do
        @prueba1 = Bibliografia.new('Dave Thomas')
        @prueba2 = Bibliografia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
    end
    
    describe "Almacenado autores" do
    it "Debe existir un autor" do
        @prueba1.autores.should eq('Dave Thomas')
    end
    it "Deben existir mas de un autor" do
        @prueba2.autores.should eq(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
    end
  end
end
  