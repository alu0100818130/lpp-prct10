require 'spec_helper'
require 'my_gem/bibliog'

describe Bibliografia do
    before :each do
        @prueba1 = Bibliografia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide')
        @prueba2 = Bibliografia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide','The Facets of Ruby')
    end
    
    describe "Almacenado datos" do
    it "Deben existir mas de un autor" do
        @prueba2.autores.should eq(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
    end
    it "Debe tener un titulo" do
        @prueba2.titulo.should eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide')
    end
    it "Debe tener o no una serie" do
        @prueba2.serie.should eq('The Facets of Ruby')
        @prueba1.serie.should eq('0')
    end
  end
end
  