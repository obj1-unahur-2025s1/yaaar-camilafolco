import piratas.*

class Barco {
    const property tripulantes = #{}
    var misionActual
    var property capacidad
    
    method cambiarMision(nueva) {
        misionActual = nueva
        tripulantes.removeAll(tripulantes.filter({t => ! t.esUtilPara(nueva)}))
    }
    method añadirTripulante(pirata) {
        if (pirata.esUtilPara(misionActual) and capacidad > tripulantes.size()) {
            tripulantes.add(pirata)
        } else {
            self.error("El pirata no está capacitado o no hay más lugar disponible")
        }
    }
    method tieneLlave() = tripulantes.any({t => t.items().contains("llave")})
    method tieneSuficienteTripulacion() = tripulantes.size() >= (capacidad * 0.9)
    method esTemible() = tripulantes.all({t => t.esUtilPara(misionActual)})
    method pasadoDeGrog() = tripulantes.any({t => t.pasadoDeGrog()})
    method estaEbrio() = tripulantes.any{t => t.ebriedad() >= 50}
    method elMasEbrio() = tripulantes.max({t => t.ebriedad()})
    method anclarEnCiudad(ciudad) {
        tripulantes.forEach({t => t.beber()})
        tripulantes.remove(self.elMasEbrio())
        ciudad.añadirHabitante(self.elMasEbrio())
    }
    method esVulnerableA(enemigo) = tripulantes.size() < (enemigo.tripulantes().size() / 2)
    method estanTodosPasados() = tripulantes.all({t => t.pasadoDeGrog()})
    method cantidadDePasados() = tripulantes.count({t => t.pasadoDeGrog()})
    method pasadosActualmente() = tripulantes.filter({t => t.pasadoDeGrog()})
    method itemsAcumuladosDePasados() {
        const acumulados = #{}
        self.pasadosActualmente().forEach({p =>acumulados.addAll(p.items())})
        return acumulados
    }
    method pasadoConMasDinero() = self.pasadosActualmente().max({t => t.monedas()})
    method esBarco() = true
}

class Mision {
    
    method puedeSerRealizada(pirata, barco) = self.pirataEsUtil(pirata) and self.puedeSerRealizadaPor(barco)
    method pirataEsUtil(pirata) 
    method puedeSerRealizadaPor(barco) = barco.tieneSuficienteTripulacion()
}

class BusquedaDelTesoro inherits Mision {

    override method puedeSerRealizadaPor(barco) = super(barco.tieneSuficienteTripulacion()) and barco.tieneLlave()

    override method pirataEsUtil(pirata) {
        return pirata.tieneItemsCorrectosParaBusqueda() && pirata.tieneMenosDe5Monedas()
    }
}

class ConvertirseEnLeyenda inherits Mision{
    var property item
    
    override method pirataEsUtil(pirata) = pirata.tieneAlMenos10Items() && pirata.tieneItemObligatorio(self)
}

class Saqueo inherits Mision {
    var property objetivo
    const property monedasNecesarias

    override method pirataEsUtil(pirata) = pirata.tieneMonedasNecesarias(self) && pirata.seAnimaASaquear(objetivo)
    override method puedeSerRealizadaPor(barco) = super(barco.tieneSuficienteTripulacion()) && objetivo.esVulnerableA(barco)
}

class CiudadCostera {
    const property habitantes = #{}
    
    method cantidadHabitantes() = habitantes.size()
    method añadirHabitante(persona) {habitantes.add(persona)}
    method esVulnerableA(enemigo) {
        return enemigo.tripulantes().size() == (self.cantidadHabitantes() * 0.4) or enemigo.estanTodosPasados()
    } 
    method esBarco() = false
}