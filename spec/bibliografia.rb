require 'spec_helper'
require 'my_gem/bibliog'
require 'my_gem/libcola'
  
  #Fin
  
  
  describe Lista_Bibliog_Ant do
    before :each do
        @l1 = Libro.new(['Rodriguez'],['David'], 'Libro1', 'Generacionx', 2009, 'May 3 2010', ['5555544567893','1423568975'], 'Nice')
        @l2 = Libro.new(['Francisco','Gabriel'],['Jimenez','Perez'], 'AAAAAAAAAA', 'XXXXXXXXX', 1, 'July 9 2005', ['4567891254','1025478963254'])
        @r1 = Revista.new(['Paco'],['Fernandez'], 'hola', 'Intento', 1, 'January 18 2013', '1245638970')
        @p1 = Periodico.new(['Juan'], ['Diaz'],'Sucesos', 'El Pais', 1, 'December 5 2015', 15)
        @e1 = Electronico.new(['Pedro'],['Picapiedra'],'Electric1', 'XXXXXXXXX', 3, 'November 17 2015', 'www.electric1.com')
        #Lista_Bibliog_Ant son CITAS
        @lb1 = Lista_Bibliog_Ant.new(@l1) 
        @lb2 = Lista_Bibliog_Ant.new(@l2)
        @lb3 = Lista_Bibliog_Ant.new(@r1)
        @lb4 = Lista_Bibliog_Ant.new(@p1)
        @lb5 = Lista_Bibliog_Ant.new(@e1)
        #Class de ordenación de CITAS
        @conjuntobibliog = Cola_ordenacion.new()
    end
    
    describe "#almacenamiento " do
        it "Comprobacion" do
            #ANTBIB ES LA VARIABLE DONDE SE ALMACENA LA BIBLIOGRAFIA DE LA CITA
            expect(@lb1.antbib).to eq(@l1)
        end
    end
    
    describe "#formateo " do
        it "Formateo de un autor" do
            expect(@lb1.get_autores).to eq('Autor, D. R. ')
        end
        it "Formateo de varios autores" do
            expect(@lb2.get_autores).to eq('Autor, J. F. & Autor, P. G. ')
        end
    end
    
    describe "#insercion y extraccion " do
        it "Debe insertarse y extraerse una Bibliografia" do
            expect(@conjuntobibliog.insertar(@lb1)).to eq(true)
            expect(@conjuntobibliog.extraer).to eq(@lb1)
        end
    end
    
    describe "#ordenacion " do
        it "Las Bibliografias ordenadas" do
            expect(@conjuntobibliog.insertar(@lb1)).to eq(true)
            expect(@conjuntobibliog.insertar(@lb2)).to eq(true)
            expect(@conjuntobibliog.insertar(@lb3)).to eq(true)
            expect(@conjuntobibliog.ordenacion).to eq([@lb1,@lb3,@lb2])
        end
    end
    
    describe "#mayusculas " do
        it "La primera letra del titulo Mayusculas" do
            expect(@lb3.get_titulo).to eq('Hola')
        end
    end
    describe "#Formateo" do
        it "Formateo de un Libro" do
            expect(@lb1.to_s).to eq("Autor, D. R. (May 3 2010). Libro: Libro1 (2009). Editorial: Generacionx.   ")
            expect(@lb2.to_s).to eq("Autor, J. F. & Autor, P. G. (July 9 2005). Libro: AAAAAAAAAA (1). Editorial: XXXXXXXXX.   ")
            expect(@lb3.to_s).to eq("Autor, F. P. (January 18 2013). Revista: hola (1). Editorial: Intento.   ")
            expect(@lb4.to_s).to eq("Autor, D. J. (December 5 2015). Periodico: Sucesos (1). Editorial: El Pais.   ")
            expect(@lb5.to_s).to eq("Autor, P. P. (November 17 2015). Titulo: Electric1 (3). Editorial: XXXXXXXXX.   ")
        end
    end
end