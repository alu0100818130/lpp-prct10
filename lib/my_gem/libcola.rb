Nodo = Struct.new(:value,:next)

class Lista
    attr_reader :principio, :fin
    
    def initialize
        @principio = nil
        @fin = nil
    end
    
    def vacia
        if (@principio == nil)
            return true
        else
            return false
        end
    end
    
    def insertar (elemento)
        nodo = Nodo.new(elemento,nil)
        if(vacia == true)
            @fin = nodo
            @principio = nodo
        else
            @fin.next = nodo
            @fin = nodo
        end
        true
    end
    
    def extraer
        if(vacia == true)
            return false
        else
            valor = @principio.value
            @principio = @principio.next
            return valor
        end
    end
        
end