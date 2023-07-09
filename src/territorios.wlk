import seres.*

class Territorio {
	const property seres = #{}
	var property lembas = 10
	var property tabaco = 10
	method aniadirSer(ser) { seres.add(ser) }
	method sacarSer(ser) { seres.remove(ser) }
	method seresTorpes() = seres.filter({ser => ser.habilidad() < 1000})
	method valorInmortalMasHabilidoso() = self.inmortales().max({ser => ser.habilidad()}).habilidad()
	method inmortales() = seres.filter({ser => ser.esInmortal()})
	method habilidadPromedio() = seres.sum({ser => ser.habilidad()}) / seres.size()
	method esSabio() = seres.all({ser => ser.habilidad() > 300})
	method huboUnTorneo() { seres.forEach({ser => ser.adquirirExperiencia()}) }
	method huboUnaEpifania() { self.seresTorpes().forEach({ser => ser.adquirirExperiencia()}) }
	method hayAlgunSerMortal() = seres.any({ser => !ser.esInmortal()})
	method capitan() = seres.filter({ser => 1000 < ser.habilidad() and ser.habilidad() < 3000}).max({ser => ser.habilidad()})
	method somnolencia() { seres.forEach({ser => ser.sufrirSuenioProfundo()}) }
	method estaEnPaz() = seres.all({ser => ser.estaConformeConElTerritorio(self)})
	method restarLembas(cant) { lembas -= cant }
	method restarTabaco(cant) { tabaco -= cant }
	method consumoDeRecursos() { seres.forEach({ser => ser.tomarRecursosDelTerritorio(self)}) }
}