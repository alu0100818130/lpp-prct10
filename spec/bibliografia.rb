require 'spec_helper'
require 'my_gem/bibliog'
require 'my_gem/libcola'

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
         @prueba2.to_s.should == ("Autores: [\"Dave Thomas\", \"Andy Hunt\", \"Chad Fowler\"], Título: Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide, Serie: The Facets of Ruby, Editorial: Pragmatic Bookshelf, 4 Edición, Fecha de Publicación: July 7, 2013 y ISBN: [\"ISBN-13: 978-1937785499\", \"ISBN-10: 1937785491\"]") #Expresión
     end
  end
  
end

  describe Lista do
    before :all do
        
        #Ejemplos 
        
        @b1 = Bibliografia.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7', 2013, ['9781937785499', '1937785491'], 'The Facets of Ruby')
        @b2 = Bibliografia.new('Scott Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2009, ['9781430218333','1430218339'], 'Pro')
        @b3 = Bibliografia.new(['David Flanagan','Yukihiro Matsumoto'], 'The Ruby Programming Language', 'O’Reilly Media', 1, 'February 4', 2008, ['0596516177','9780596516178'])
        @b4 = Bibliografia.new(['David Chelimsky','Dave Astels','Bryan Helmkamp','Dan North','Zach Dennis','Aslak Hellesoy'], 'The RSpecBook: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'Pragmatic Bookshelf', 1, 'December 25', 2010, ['1934356379','9781934356371'], 'The Facets of Ruby')
        @b5 = Bibliografia.new('Richard E. Silverman','Git Pocket Guide', 'O’Reilly Media', 1, 'August 2', 2013, ['1449325866','9781449325862'])
        
        @l1 = Lista.new()
        @l2 = Lista.new()
        @l3 = Lista.new()
        
    end
    describe "Se crea una lista" do
        it "El nodo inicial es nulo" do
            @l1.principio.should eq(nil)
        end
        it "Tambien el nodo final es nulo" do
            @l1.fin.should eq(nil)
        end
    end
    describe "Metodo para ver si la lista esta vacia" do
        it "Debe existir este método" do
            @l1.vacia.should eq(true)
        end
    end
    describe "Metodo para insertar un elemento en la lista" do
        it "Debe existir este método" do
            @l2.insertar(@b1).should eq(true)
        end
    end
    describe "Metodo para extraer un elemento en la lista" do
        it "Debe existir este método" do
            @l2.extraer.should eq(@b1)
        end
    end
    describe "Insertar mas de un elemento" do
        it "Se puede insertar mas de un elemento" do
            @l3.insertar(@b1).should eq(true)
            @l3.insertar(@b2).should eq(true)
            @l3.insertar(@b3).should eq(true)
            @l3.insertar(@b4).should eq(true)
            @l3.insertar(@b5).should eq(true)
        end
    end
    describe "Se deberia poder extraer mas de un elemento" do
        it "Se puede extraer mas de un elemento" do
            @l3.extraer.should eq(@b1)
            @l3.extraer.should eq(@b2)
            @l3.extraer.should eq(@b3)
            @l3.extraer.should eq(@b4)
            @l3.extraer.should eq(@b5)
        end
    end
            
end