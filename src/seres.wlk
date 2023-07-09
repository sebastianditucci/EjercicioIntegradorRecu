import escondites.*

class Elfo {
	var cancionesConocidas = 20
	method cancionesConocidas() = cancionesConocidas.min(0)
	method esInmortal() = true
	method habilidad() {
		if (cancionesConocidas <= 60) { return 180 }
		else { return cancionesConocidas * 3 }
	}
	method adquirirExperiencia() {cancionesConocidas = cancionesConocidas * 2}
	method sufrirSuenioProfundo() { cancionesConocidas -= 10 }
	method estaConformeConElTerritorio(territorio) = territorio.lembas() >= 8
	method tomarRecursosDelTerritorio(territorio) { 
		territorio.restarLembas(3)
		cancionesConocidas += 15
	}
}

class Hobbit {
	var property amigos = 40
	var historiasEscuchadas = 6
	method habilidad() { if (amigos < 60) { return historiasEscuchadas * 100 } else { return historiasEscuchadas * 50 } }
	method adquirirExperiencia() { amigos += 8 }
	method organizarFiesta() { 
		amigos += 5
		historiasEscuchadas += 5
	}
	method esInmortal() = amigos > 20
	method sufrirSuenioProfundo() { amigos -= 3 }
	method estaConformeConElTerritorio(territorio) = territorio.seres().filter({ser => ser.habilidad() > self.habilidad()}).size() >= 2
	method tomarRecursosDelTerritorio(territorio) {
		territorio.restarTabaco(4)
		amigos += 7
		historiasEscuchadas += 7
	}
}

class Enano {
	var ira = 200
	method ira() = ira
	method habilidad() = ira * 2
	method adquirirExperiencia() { ira += 300 }
	method esInmortal() = false
	method sufrirSuenioProfundo() { ira -= 50 }
	method estaConformeConElTerritorio(territorio) = territorio.seresTorpes().size() >= 1
	method tomarRecursosDelTerritorio(territorio) {}
	method equilibrarse() {
		if (self.habilidad() <= 700) { self.adquirirExperiencia() } else { self.sufrirSuenioProfundo() }
	}
}

class ElfoSilvano inherits Elfo { override method habilidad() = super() + 400 }

class EnanoHerrero inherits Enano { 
	var espadasFabricadas = 3
	override method habilidad() = espadasFabricadas * 100
	override method adquirirExperiencia() {
		super()
		espadasFabricadas += 1
	}
}

class EnanoFurioso inherits Enano {
	var property topeDeHabilidad = 2000 
	// asumo que la logica para calcular la habilidad sigue siendo la misma que la del enano, solo que con el tope variable agregado.
	override method habilidad() = super().min(topeDeHabilidad)
}

class EnanoMinero inherits Enano {
	const property escondites = #{}
	override method adquirirExperiencia() {
		super()
		escondites.add(new Escondite())
	}
	override method sufrirSuenioProfundo() {
		if (escondites.size() > 2) { escondites.forEach({esc => esc.agregarCandados(1)}) } else { super() }
	}
	override method ira() = super() + escondites.sum({esc => esc.valor()})
}