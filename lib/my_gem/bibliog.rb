class Bibliografia
    include Comparable
    attr_reader :autores, :apel, :titulo, :serie, :editorial, :edicion, :fdp, :isbn, :x, :y
    def initialize(a,ap,b,d,e,f,g,c='0')
       @autores= a
       @apel= ap
       @titulo=b
       @editorial=d
        @edicion=e
        @fdp=f
        @isbn=g
        @serie=c
    end
    
    def <=> (other)
        if (@apel == other.apel)
            if (@fdp == other.fdp)
                @titulo <=> other.titulo
            else
                @fdp <=> other.fdp
            end
        else
            @apel <=> other.apel
        end
    end
    
    def obtenerautores
     size = @autores.length
        i = 0
        while i < (size-1)
            mensaje = "#{mensaje}"+"#{@autores[i]} #{@apel[i]}, "
            i = i+1
        end
            mensaje = "#{mensaje}"+"#{@autores[i]} #{@apel[i]}"
    end
    
    def obtenertitulo
     @titulo
    end
    
    def obtenerserie
     @serie
    end
    
    def obtenereditorial
     @editorial
    end
    
    def obteneredicion
     @edicion
    end
    
    def obtenerfdp
     @fdp
    end
    
    def obtenerisbn
     @isbn
    end
    
    def to_s
    "Autores: #@autores, Título: #@titulo, Serie: #@serie, Editorial: #@editorial, #@edicion Edición, Fecha de Publicación: #@fdp y ISBN: #@isbn"
    end
end


class Libro < Bibliografia
    attr_reader :isbn1
    
    def initialize (a,ap,b,d,e,f,g,c='0')
        super(a,ap,b,d,e,f,g,c)
        @isbn1=g
    end
    
end

class Revista < Bibliografia
    attr_reader :issn
    
    def initialize (a,ap,b,d,e,f,g,c='0')
        super(a,ap,b,d,e,f,"none",c)
        @issn=g
    end
end

class Periodico < Bibliografia
    attr_reader :columnas
    
    def initialize (a,ap,b,d,e,f,g,c='0')
        super(a,ap,b,d,e,f,"none",c)
        @columnas=columnas
    end
end

class Electronico < Bibliografia
    attr_reader :url
    
    def initialize (a,ap,b,d,e,f,g,c='0')
        super(a,ap,b,d,e,f,"none",c='0')
        @url=g
    end
end