require 'spec_helper'
require 'my_gem/bibliog'

describe Bibliografia do
    before :each do
        @prueba1 = Bibliografia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide','Pragmatic Bookshelf',2,'July 3, 2010')
        @prueba2 = Bibliografia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide','Pragmatic Bookshelf',4,'July 7, 2013', 'The Facets of Ruby')
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
     it "Debe tener un editorial" do
        @prueba2.editorial.should eq('Pragmatic Bookshelf')
        @prueba1.editorial.should eq('Pragmatic Bookshelf')
    end
      it "Deben tener un numero de edicion" do
        @prueba2.edicion.should eq(4)
        @prueba1.edicion.should eq(2)
    end
    it "Debe tener una fecha de publicacion" do
        @prueba2.fdp.should eq('July 7, 2013')
        @prueba1.fdp.should eq('July 3, 2010')
    end
  end
end
  