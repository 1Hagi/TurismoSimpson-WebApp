package model;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

public class Excursion extends Oferta {

	private Integer tiempo;
	private Double costo;
	private Integer cupo;
	
	private Map<String, String> errors;

	public Excursion(String nombre, String imagen_ruta, Integer id, OfertaTipo tipo, Integer tiempo, Double dinero, Integer cupo, String descripcion, String soft_delete) {
		super(nombre, imagen_ruta, id, tipo, descripcion, soft_delete);
		this.tiempo = tiempo;
		this.costo = dinero;
		this.cupo = cupo;
	}

	public Integer getTiempo() {
		return tiempo;
	}

	public Double getCosto() {
		return costo;
	}

	public Integer getCupo() {
		return cupo;
	}

	public void venderCupo() {
		this.cupo--;
	}

	@Override
	public String toString() {
		DecimalFormat frmt = new DecimalFormat("#.00");
		return "  Excursion: " + super.nombre + "  --> tipo: <" + this.tipo + ">, costo: <$ " + frmt.format(this.costo)
				+ ">, tiempo: <" + this.tiempo + " min.>\n";
	}
	
	public boolean isValid() {

		errors = new HashMap<String, String>();
		
		if (costo <= 0)
			errors.put("costo", "Debe ser positivo");

		if (tiempo <= 0)
			errors.put("tiempo", "Debe ser positivo");
		
		if (cupo <= 0)
			errors.put("cupo", "Debe ser positivo");
			
		return errors.isEmpty();
	}
}
