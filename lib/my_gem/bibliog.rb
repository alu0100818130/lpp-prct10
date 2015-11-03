class Bibliografia
    attr_reader :autores, :titulo,:serie, :editorial, :edicion
    def initialize(a,b,d,e,c='0')
       @autores= a
       @titulo=b
       @editorial=d
        @edicion=e
         @serie=c
    end
    
end
