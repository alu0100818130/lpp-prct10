Nodo = Struct.new(:value,:next, :prev)

class Cola
    include Enumerable
    attr_reader :principio, :fin
    
    def initialize()
        @principio = nil
        @fin = nil
    end
    
        def each
               aux = @principio
               while aux != nil
		            yield aux.value
		            aux = aux.next
               end
        end	
    
    def vacia
        if (@principio == nil)
            return true
        else
            return false
        end
    end
    
    def insertar (elemento)
        #Creo el nodo que quiero insertar
        nodo = Nodo.new(elemento,nil)
        #En caso de cola vacia
        if(vacia == true)
            @fin = nodo
            @principio = nodo
        else
            #En caso de cola ocupada meto por el fin
            @fin.next = nodo
            @fin = nodo
        end
        true
    end
    
    def extraer
        #En caso de que este vacia no devuelve nada
        if(vacia == true)
            return false
        else
            #En caso de que tenga algo, lo saco por el principio
            valor = @principio.value
            @principio = @principio.next
            return valor
        end
    end
    
    def insertar_principio (elemento)
        nodo = Nodo.new(elemento,nil,nil)
        if(vacia == true)
            @fin = nodo
            @principio = nodo
        else
            nodo.next = @principio
            @principio.prev = nodo
            @principio = nodo
        end
        true
    end
    
    def extraer_fin
        if(vacia == true)
            return false
        else
            valor = @fin.value
            @fin = @fin.prev
            if(@fin == nil)
                @principio = nil
            else
                @fin.next = nil
            end
            return valor
        end
    end   
end

#Lista_Bibliog_Ant son CITAS
class Lista_Bibliog_Ant
    
    include Comparable
    attr_reader :antbib
    
    def initialize (b)
        #ANTBIB ES LA VARIABLE DONDE SE ALMACENA LA BIBLIOGRAFIA DE LA CITA
       @antbib=b 
    end

    def get_autores
        size = @antbib.autores.length
        i = 0
        while i < (size-1)
            mensaje = "#{mensaje}"+"Autor, "
            mensaje = "#{mensaje}"+"#{@antbib.apel[i][0]}. #{@antbib.autores[i][0]}. & "
            i = i+1
        end
        mensaje = "#{mensaje}"+"Autor, "
        mensaje = "#{mensaje}"+"#{@antbib.apel[i][0]}. #{@antbib.autores[i][0]}. "
    end
    
    def <=>(other)
        if(@antbib.apel == other.antbib.apel)
            if(@antbib.fdp == other.antbib.fdp)
                @antbib.titulo <=> other.antbib.titulo
            else
                @antbib.fdp <=> other.antbib.fdp
            end
        else
            @antbib.apel <=> other.antbib.apel
        end
    end
    
    def get_titulo
        size = @antbib.titulo.length
        @antbib.titulo[0] = @antbib.titulo[0].capitalize
        i=0
        while i < size
            if (@antbib.titulo[i] == " ")
                antbib.titulo[i+1] = antbib.titulo[i+1].capitalize
            end
            i = i+1
        end
        @antbib.titulo
    end
    
    def to_s
        if @antbib.instance_of?Libro
            mensaje = "#{get_autores}(#{@antbib.fdp}). Libro: #{@antbib.titulo} (#{@antbib.edicion}). Editorial: #{@antbib.editorial}.   "
        end
        if @antbib.instance_of?Revista
            mensaje = "#{get_autores}(#{@antbib.fdp}). Revista: #{@antbib.titulo} (#{@antbib.edicion}). Editorial: #{@antbib.editorial}.   "
        end
        if @antbib.instance_of?Periodico
            mensaje = "#{get_autores}(#{@antbib.fdp}). Periodico: #{@antbib.titulo} (#{@antbib.edicion}). Editorial: #{@antbib.editorial}.   "
        end
        if @antbib.instance_of?Electronico
            mensaje = "#{get_autores}(#{@antbib.fdp}). Titulo: #{@antbib.titulo} (#{@antbib.edicion}). Editorial: #{@antbib.editorial}.   "
        end
        mensaje
    end
    
end
#Class de ordenación de CITAS
class Cola_ordenacion
    attr_accessor :c1, :ordenacion
     
    def initialize
        @c1 = Cola.new()
    end
    
    def insertar(a)
        aux = @c1.insertar(a)
        @ordenacion = @c1.sort
        aux
    end
    
    def extraer
        @c1.extraer
    end
    
end