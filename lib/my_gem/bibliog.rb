class Bibliografia
    attr_reader :autores, :titulo,:serie, :editorial, :edicion, :fdp, :isbn
    def initialize(a,b,d,e,f,g,c='0')
       @autores= a
       @titulo=b
       @editorial=d
        @edicion=e
        @fdp=f
        @isbn=g
         @serie=c
    end
    
end
