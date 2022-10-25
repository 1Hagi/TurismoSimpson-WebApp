package model;

import java.util.List;

public class PromoAxB extends Promocion {

	private Integer cantGratis;

	public PromoAxB(String nombre, String imagen_ruta, Integer id, OfertaTipo tipo, List<Excursion> excursiones, Integer cantGratis, String descripcion, String soft_delete) {
		super(nombre, imagen_ruta, id, tipo, excursiones, descripcion, soft_delete);
		this.cantGratis = cantGratis;
	}

	public Integer getCantGratis() {
		return cantGratis;
	}

	public Double getCosto() {
		Double costoTotal = 0.0;
		for (int i = 0; i < this.excursiones.size() - cantGratis; i++) {
			costoTotal += this.excursiones.get(i).getCosto();
		}
		return costoTotal;
	}

	@Override
	public String mostrarExcursiones() {
		if(this.excursiones.size() == 0) {
			return "\n--> Promocion �" + this.nombre + "� aun no tiene excursiones incluidas";
		}
		String excursiones = "\n--> Excursiones pagas:";
		for (int i = 0; i < this.excursiones.size() - this.cantGratis; i++) {
			excursiones += "\n" + this.excursiones.get(i);
		}
		excursiones += "\n--> Excursiones Gratis:\n" + this.excursiones.get(this.excursiones.size() - 1);
		return excursiones;
	}

	@Override
	public String toString() {
		return "Promocion AxB: '" + this.nombre + "' incluye las excursiones:" + this.mostrarExcursiones()
				+ "\n\tTiempo total necesario: " + this.getTiempo() + " min.\n\tCosto en dinero total: $ "
				+ this.getCosto();
	}
}
