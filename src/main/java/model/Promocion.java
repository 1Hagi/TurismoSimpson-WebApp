package model;

import java.util.*;

public abstract class Promocion extends Oferta {

	List<Excursion> excursiones;

	public Promocion(String nombre, String imagen_ruta, Integer id, OfertaTipo tipo, List<Excursion> excursiones, String descripcion, String soft_delete) {
		super(nombre, imagen_ruta, id, tipo, descripcion, soft_delete);
		this.excursiones = new ArrayList<Excursion>();
		for (Excursion o : excursiones) {
			this.excursiones.add(o);
		}
	}

	public Integer getTiempo() {
		Integer tiempoTotal = 0;
		for (Oferta e : excursiones) {
			tiempoTotal += e.getTiempo();
		}
		return tiempoTotal;
	}

	public Integer getCupo() {
		Integer cupoTotal = 99;
		for (Oferta e : excursiones) {
			if (cupoTotal > e.getCupo()) {
				cupoTotal = e.getCupo();
			}
		}
		return cupoTotal;
	}

	public void venderCupo() {
		for (Oferta e : this.excursiones) {
			e.venderCupo();
		}
	}

	public List<Excursion> getExcursiones() {
		return this.excursiones;
	}

	public String mostrarExcursiones() {
		String excursiones = "";
		for (Excursion e : this.excursiones) {
			excursiones += "\n" + e.toString();
		}
		return excursiones;
	}
}