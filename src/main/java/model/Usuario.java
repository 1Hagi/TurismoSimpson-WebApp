package model;

import java.io.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Usuario {

	private Integer id;
	private String nombre;
	private String contraseña;
	private Boolean admin;
	private Integer tiempoDisponible;
	private Double dineroDisponible;
	private OfertaTipo tipoFavorito;
	private Itinerario itinerario;
	private Boolean soft_delete;
	
	private Map<String, String> errors;

	public Usuario(Integer id, String nombre, String contraseña, String admin, OfertaTipo tipoFavorito, Integer tiempoDisponible,
			Double dineroDisponible, String soft_delete) {
		this.id = id;
		this.nombre = nombre;
		this.contraseña = contraseña;
		this.admin = (admin.equals("1")) ? true : false;
		this.soft_delete = (soft_delete.equals("1")) ? true : false;
		this.tiempoDisponible = tiempoDisponible;
		this.dineroDisponible = dineroDisponible;
		this.tipoFavorito = tipoFavorito;
		this.itinerario = new Itinerario();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return this.nombre;
	}

	public Integer getTiempoDisponible() {
		return tiempoDisponible;
	}

	public Double getDineroDisponible() {
		return dineroDisponible;
	}

	public OfertaTipo getFavorito() {
		return this.tipoFavorito;
	}

	public String getItinerario() {
		return this.itinerario.toString();
	}

	public ArrayList<Oferta> getOfertasCompradas() {
		return this.itinerario.getOfertasCompradas();
	}

	public ArrayList<Oferta> getOfertasIgnoradas() {
		return this.itinerario.getOfertasIgnoradas();
	}

	public void comprar(Oferta unaOferta) {
		this.dineroDisponible -= unaOferta.getCosto();
		this.tiempoDisponible -= unaOferta.getTiempo();
		this.itinerario.addOfertasCompradas(unaOferta);
	}

	public void denegar(Oferta unaOferta) {
		this.itinerario.addOfertasIgnoradas(unaOferta);
	}

	public boolean responderPregunta() throws IOException {

		String respuesta = null;
		boolean r = false;

		InputStreamReader sr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(sr);

		respuesta = br.readLine();
		respuesta = respuesta.toLowerCase();

		int intentos = 3;
		int ans = -1;

		while (intentos >= 1 && ans == -1) {
			if (respuesta.equals("si") || respuesta.equals("s")) {
				ans = 1;
				r = true;
			} else if (respuesta.equals("no") || respuesta.equals("n")) {
				ans = 0;
				r = false;
			} else if (intentos > 1) {
				System.out.println(
						".. la respuesta ingresada es incorrecta, debe contestar con 'Si' o 'No' (intentos restantes "
								+ (intentos - 1) + ")");
				respuesta = br.readLine();
				respuesta = respuesta.toLowerCase();
			} else {
				System.out.println(".. intentos agotados, la oferta se rechazara automaticamente .. ");
				ans = 0;
				r = false;
			}
			intentos--;
		}
		return r;
	}

	@Override
	public String toString() {
		DecimalFormat frmt = new DecimalFormat("#.00");
		return "Cliente [nombre=" + nombre + ", tiempoDisponible=" + tiempoDisponible + ", dineroDisponible="
				+ frmt.format(dineroDisponible) + ", tipoFavorito=" + tipoFavorito + "]";
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public boolean isNull() {
		return false;
	}
	
	public boolean isValid() {

		errors = new HashMap<String, String>();
		
		if (dineroDisponible <= 0)
			errors.put("presupuesto", "Debe ser positivo");

		if (tiempoDisponible <= 0)
			errors.put("tiempo_disponible", "Debe ser positivo");
			
		return errors.isEmpty();
	}

	public boolean checkPassword(String password) {
		return this.contraseña.equals(password);
	}

	public Boolean getAdmin() {
		return admin;
	}

	public Boolean getSoft_delete() {
		return soft_delete;
	}

	public void setSoft_delete(Boolean soft_delete) {
		this.soft_delete = soft_delete;
	}

	public boolean tieneDineroPara(Oferta oferta) {
		return (this.dineroDisponible > oferta.getCosto()) ? true : false;
	}

	public boolean tieneTiempoPara(Oferta oferta) {
		return (this.tiempoDisponible > oferta.getTiempo()) ? true : false;
	}

}
