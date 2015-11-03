class Bibliografia
    attr_reader :autores, :titulo,:serie, :editorial, :edicion, :fdp
    def initialize(a,b,d,e,f,c='0')
       @autores= a
       @titulo=b
       @editorial=d
        @edicion=e
        @fdp=f
         @serie=c
    end
    
end
