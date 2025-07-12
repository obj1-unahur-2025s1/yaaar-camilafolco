import misionesYbarcos.*

class Pirata {
    const property items = []
    var property ebriedad
    var property monedas
    var property barcoActual 

    method añadirItem(item) {items.add(item)}
    method tieneMenosDe5Monedas() = monedas <= 5 
    method tieneItemsCorrectosParaBusqueda() = items.contains("mapa") or items.contains("brujula") or items.contains("grog")   
    method tieneAlMenos10Items() = items.size() >= 10
    method tieneItemObligatorio(mision) = items.contains(mision.item())
    method tieneMonedasNecesarias(mision) = monedas < mision.monedasNecesarias()
    method pasadoDeGrog() = ebriedad >= 90
    method medioEbrio() = ebriedad.between(50, 90)
    method seAnimaASaquear(objetivo) {
        if (objetivo.esBarco()) {
           return self.pasadoDeGrog() 
        } else {
           return self.medioEbrio()
        }
    }
    method esUtilPara(mision) = mision.pirataEsUtil(self)
    method beber() {
        ebriedad += 5
        monedas = (monedas - 1).max(0)
    }   
    method invitar(pirata) {
        barcoActual.tripulantes().add(pirata)
    }
}

class Espia inherits Pirata {

    override method beber() {ebriedad = 0}
    override method seAnimaASaquear(objetivo) {
        super(
        if (objetivo == Barco) {
           return self.pasadoDeGrog() 
        } else {
           return self.medioEbrio()
        }) and items.contains("permiso de la corona")       
    }
}



