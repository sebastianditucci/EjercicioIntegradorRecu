class Escondite {
	var oroEscondido = 3
	var cantCandados = 5
	method agregarCandados(cant) { cantCandados += 1 }
	method restarCandados(cant) { cantCandados -= 1 }
	method agregarOro(cant) { oroEscondido += 1 }
	method restarOro(cant) { oroEscondido -= 1 }
	method valor() = (cantCandados * oroEscondido) + 20
}