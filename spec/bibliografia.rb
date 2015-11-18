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

  describe Cola do
    before :all do
        
        #Ejemplos 
                             
        @b1 = Bibliografia.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7 2013', ['9781937785499', '1937785491'], 'The Facets of Ruby')
        @b2 = Bibliografia.new('Scott Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27 2009', ['9781430218333','1430218339'], 'Pro')
        @b3 = Bibliografia.new(['David Flanagan','Yukihiro Matsumoto'], 'The Ruby Programming Language', 'O’Reilly Media', 1, 'February 4 2008', ['0596516177','9780596516178'])
        @b4 = Bibliografia.new(['David Chelimsky','Dave Astels','Bryan Helmkamp','Dan North','Zach Dennis','Aslak Hellesoy'], 'The RSpecBook: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'Pragmatic Bookshelf', 1, 'December 25 2010', ['1934356379','9781934356371'], 'The Facets of Ruby')
        @b5 = Bibliografia.new('Richard E. Silverman','Git Pocket Guide', 'O’Reilly Media', 1, 'August 2 2013', ['1449325866','9781449325862'])
        
        @c1 = Cola.new()
        @c2 = Cola.new()
        @c3 = Cola.new()
        
    end
    describe "Se crea una cola" do
        it "El nodo inicial es nulo" do
            expect(@c1.principio).to eq(nil)
            #@c1.principio.should eq(nil)
        end
        it "Tambien el nodo final es nulo" do
            expect(@c1.fin).to eq(nil)
            #@c1.fin.should eq(nil)
        end
    end
    describe "Metodo para ver si la cola esta vacia" do
        it "Debe existir este método" do
            expect(@c1.vacia).to eq(true)
            #@c1.vacia.should eq(true)
        end
    end
    describe "Metodo para insertar un elemento en la cola" do
        it "Debe existir este método" do
            expect(@c2.insertar(@b1)).to eq(true)
            #@c2.insertar(@b1).should eq(true)
        end
    end
    describe "Metodo para extraer un elemento en la cola" do
        it "Debe existir este método" do
            expect(@c2.insertar(@b1)).to eq(true)
            expect(@c2.extraer).to eq(@b1)
            #@c2.insertar(@b1).should eq(true)
            #@c2.extraer.should eq(@b1)
        end
    end
    describe "Insertar mas de un elemento en la cola" do
        it "Se puede insertar mas de un elemento en la cola" do
            
            expect(@c3.insertar(@b1)).to eq(true)
            expect(@c3.insertar(@b2)).to eq(true)
            expect(@c3.insertar(@b3)).to eq(true)
            expect(@c3.insertar(@b4)).to eq(true)
            expect(@c3.insertar(@b5)).to eq(true)
            
            #@c3.insertar(@b1).should eq(true)
            #@c3.insertar(@b2).should eq(true)
            #@c3.insertar(@b3).should eq(true)
            #@c3.insertar(@b4).should eq(true)
            #@c3.insertar(@b5).should eq(true)
        end
    end
    describe "Se deberia poder extraer mas de un elemento de la cola" do
        it "Se puede extraer mas de un elemento de la cola" do
            
            expect(@c3.insertar(@b1)).to eq(true)
            expect(@c3.insertar(@b2)).to eq(true)
            expect(@c3.insertar(@b3)).to eq(true)
            expect(@c3.insertar(@b4)).to eq(true)
            expect(@c3.insertar(@b5)).to eq(true)
            
            expect(@c3.extraer).to eq(@b1)
            expect(@c3.extraer).to eq(@b2)
            expect(@c3.extraer).to eq(@b3)
            expect(@c3.extraer).to eq(@b4)
            expect(@c3.extraer).to eq(@b5)
            
            #@c3.insertar(@b1).should eq(true)
            #@c3.insertar(@b2).should eq(true)
            #c3.insertar(@b3).should eq(true)
            #@c3.insertar(@b4).should eq(true)
            #@c3.insertar(@b5).should eq(true)
            
            #@c3.extraer.should eq(@b1)
            #@c3.extraer.should eq(@b2)
            #@c3.extraer.should eq(@b3)
            #@c3.extraer.should eq(@b4)
            #@c3.extraer.should eq(@b5)

        end
    end
            
end

describe Libro do
    before :all do
        @l1 = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27 2009', ['9781430218333','1430218339'], 'Pro')
    end
    
    describe "Comprobar instancia" do
        it "Instancia de Libro" do
           (@l1.instance_of?Libro).should eq(true)
        end
    end
    
    describe " Comprobar la jerarquia de clases" do
        it "Pertenece a la jerarquia de clase de Bibliografia" do
            (@l1.is_a?Bibliografia).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            (@l1.is_a?Object).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            (@l1.is_a?BasicObject).should eq(true)
        end
    end
    
    describe "Comprobar la instancia del objeto con su madre" do
        it "No deberia ser instancia de Bibliografia" do
            (@l1.instance_of?Bibliografia).should eq(false)
        end
    end
    
    describe "Comprobar si responde a uno de los metodos de su madre" do
        it "Deberia responder a un metodo de su madre" do
            @l1.respond_to?(:autores).should eq(true)
        end
    end
    
    describe "Comprobar si responde a un metodo propio" do
        it "Deberia responder a un metodo propio" do
            @l1.respond_to?(:isbnl).should eq(true)
        end
    end
end

describe Revista do
    before :all do
        @r1 = Revista.new('Felipe', 'Decoracion de hogar', 'Hogares', 5, 'January 1 2015', 9857425)
    end
    
    describe "Comprobar la instancia" do
        it "Debe ser una instancia de Revista" do
           (@r1.instance_of?Revista).should eq(true)
        end
    end
    
    describe "Comprobar la jerarquia de clases" do
        it "Deberia pertenecer a la jerarquia de clase de Bibliografia" do
            (@r1.is_a?Bibliografia).should eq(true)
        end
        it "Deberia pertenecer a la jerarquia de clase de Object" do
            (@r1.is_a?Object).should eq(true)
        end
        it "Deberia pertenecer a la jerarquia de clase de BasicObject" do
            (@r1.is_a?BasicObject).should eq(true)
        end
    end
    
    describe "Comprobar la instancia del objeto con su madre" do
        it "No deberia ser una instancia de Bibliografia" do
            (@r1.instance_of?Bibliografia).should eq(false)
        end
    end
    
    describe "Comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            @r1.respond_to?(:autores).should eq(true)
        end
    end
    
    describe "Comprobar si responde a un metodo propio" do
        it "Deberia responder a un metodo propio" do
            @r1.respond_to?(:issn).should eq(true)
        end
    end
end