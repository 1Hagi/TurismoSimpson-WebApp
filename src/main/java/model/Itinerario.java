package model;

import java.util.*;

public class Itinerario {

	private ArrayList<Oferta> itinerario;

	public Itinerario() {
		this.itinerario = new ArrayList<Oferta>();
	}

	public ArrayList<Oferta> getItinerario() {
		return itinerario;
	}

	public void agregarUnaOferta(Oferta oferta) {
		this.itinerario.add(oferta);
	}
	
	public void agregarOfertas(List<Oferta> ofertas) {
		this.itinerario.addAll(ofertas);
	}
}
