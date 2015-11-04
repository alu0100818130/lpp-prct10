require 'spec_helper'
require 'my_gem/bibliog'

describe Bibliografia do
    before :each do
        @prueba1 = Bibliografia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide','Pragmatic Bookshelf',2,'July 3, 2010', ['ISBN-13: 978-1937785444', 'ISBN-10: 1937785221'])
        @prueba2 = Bibliografia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide','Pragmatic Bookshelf',4,'July 7, 2013',['ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'], 'The Facets of Ruby')
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
    it "Debe existir uno o mas numeros ISBN" do
        @prueba2.isbn.should eq(['ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'])
        @prueba1.isbn.should eq(['ISBN-13: 978-1937785444', 'ISBN-10: 1937785221'])
    end
  end
  
  describe "Metodos" do
      
    it "Existe un metodo para obtener el listado de autores." do 
         @prueba2.obtenerautores.should == (['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
     end
     it "Existe un metodo para obtener el titulo." do 
         @prueba2.obtenertitulo.should == ('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide')
     end
     it "Existe un metodo para obtener la serie." do 
         @prueba2.obtenerserie.should == ('The Facets of Ruby')
     end
     it "Existe un metodo para obtener la editorial." do 
         @prueba2.obtenereditorial.should == ('Pragmatic Bookshelf')
     end
     it "Existe un metodo para obtener el numero de edicion." do 
         @prueba2.obteneredicion.should == (4)
     end
     it "Existe un metodo para obtener la fecha de publicacion." do 
         @prueba2.obtenerfdp.should == ('July 7, 2013')
     end
     it "Existe un metodo para obtener el ISBN." do 
         @prueba2.obtenerisbn.should == (['ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'])
     end
     it "Existe un metodo para obtener la referencia formateada." do
     #Dave Thomas, Andy Hunt, Chad Fowler.
     #Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide
     #(The Facets of Ruby)
     #Pragmatic Bookshelf; 4 edition (July 7, 2013)
     #ISBN-13: 978-1937785499
     #ISBN-10: 1937785491
         @prueba2.formateada.should == () #Expresión
     end
  end
  
end
  