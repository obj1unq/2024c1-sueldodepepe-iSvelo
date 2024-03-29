object pepe {

	var categoria = cadete
	var bonoPorResultado = porcentaje
	var bonoPorPresentismo = normal
	var faltas = 0

	method faltas(_faltas) {
		faltas = _faltas
	}

	method faltas() {
		return faltas
	}

	method bonoPorPresentismo(_bonoPorPresentismo) {
		bonoPorPresentismo = _bonoPorPresentismo
	}

	method bonoPorResultado(_bonoPorResultado) {
		bonoPorResultado = _bonoPorResultado
	}

	method categoria(_categoria) {
		categoria = _categoria
	}

	method sueldo() {
		return self.neto() + self.resultado() + self.presentismo()
	}

	method presentismo() {
		return bonoPorPresentismo.valor(self)
	}

	method resultado() {
		return bonoPorResultado.bonoPorResultado(self)
	}

	method neto() {
		return categoria.neto()
	}

}

object gerente {

	method neto() {
		return 15000
	}

}

object cadete {

	method neto() {
		return 20000
	}

}

object vendedor {

	var aumentoDeVentas = false

	method activarAumentoPorMuchasVentas() {
		aumentoDeVentas = true
	}

	method desactivarAumentoPorMuchasVentas() {
		aumentoDeVentas = false
	}

	method neto() {
		return if (self.hayMuchasVentas()) {
			16000
		} else 20000
	}

	method hayMuchasVentas() {
		return aumentoDeVentas
	}

}

object porcentaje {

	method bonoPorResultado(empleado) {
		return empleado.neto() * 1 / 10
	}

}

object montoFijo {

	method bonoPorResultado(empleado) {
		return 800
	}

}

object resultadoNulo {

	method bonoPorResultado(empleado) {
		return 0
	}

}

object ajuste {

	method valor(empleado) {
		return if (empleado.faltas() == 0) {
			100
		} else 0
	}

}

object demagogico {

	method valor(empleado) {
		return if (empleado.neto() < 18000) {
			500
		} else 300
	}

}

object presentismoNulo {

	method valor(empleado) {
		return 0
	}

}

object normal {

	method valor(empleado) {
		return if (empleado.faltas() == 0) {
			2000
		} else if (empleado.faltas() == 1) {
			1000
		} else 0
	}

}

object presentismonulo {

	method valor(empleado) {
		return 0
	}

}

object sofia {

	var categoria = cadete
	var bonoPorResultado = resultadoNulo

	method bonoPorResultado(_bonoPorResultado) {
		bonoPorResultado = _bonoPorResultado
	}

	method categoria(_categoria) {
		categoria = _categoria
	}

	method sueldo() {
		return self.neto() + self.resultado()
	}

	method neto() {
		return categoria.neto() + 1.3
	}

	method resultado() {
		return bonoPorResultado.bonoPorResultado(self)
	}

}

