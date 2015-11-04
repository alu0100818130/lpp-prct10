class Bibliografia
    attr_reader :autores, :titulo,:serie, :editorial, :edicion, :fdp, :isbn, :x, :y
    def initialize(a,b,d,e,f,g,c='0')
       @autores= a
       @titulo=b
       @editorial=d
        @edicion=e
        @fdp=f
        @isbn=g
         @serie=c
    end
    
    def obtenerautores
     @autores
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
