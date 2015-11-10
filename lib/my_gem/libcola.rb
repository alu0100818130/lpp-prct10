Nodo = Struct.new(:value,:next)

class Cola
    attr_reader :principio, :fin
    
    def initialize()
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
        
end