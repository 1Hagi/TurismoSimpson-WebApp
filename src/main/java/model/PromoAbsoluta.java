package model;

import java.util.List;

public class PromoAbsoluta extends Promocion {

	private Double costo;

	public PromoAbsoluta(String nombre, String imagen_ruta, Integer id, OfertaTipo tipo, List<Excursion> excursiones, Double costo, String descripcion, String soft_delete) {
		super(nombre, imagen_ruta, id, tipo, excursiones, descripcion, soft_delete);
		this.costo = costo;
	}

	public Double getCosto() {
		return this.costo;
	}

	@Override
	public String toString() {
		return "Promocion Absoluta: '" + this.nombre + "' incluye las excursiones:" + super.mostrarExcursiones()
				+ "\n\tTiempo total necesario: " + this.getTiempo() + " min.\n\tCosto en dinero total: $ "
				+ this.getCosto();
	}
}
