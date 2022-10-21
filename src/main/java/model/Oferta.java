package model;

public abstract class Oferta implements Comparable<Oferta> {

	protected String nombre;
	protected Integer id;
	protected OfertaTipo tipo;
	protected String img;
	protected Boolean soft_delete;
	protected String descripcion;

	public Oferta(String nombre, String imagen_ruta, Integer id, OfertaTipo tipo, String descripcion, String soft_delete) {
		this.nombre = nombre;
		this.img = new String("img/offers/" + ((imagen_ruta != null) ? imagen_ruta : "imagen_default") + ".jpg");
		this.id = id;
		this.tipo = tipo;
		this.descripcion = descripcion;
		this.soft_delete = (soft_delete.equals("1")) ? true : false;
	}

	public String getNombre() {
		return this.nombre;
	}
	
	public String getImg() {
		return this.img;
	}

	public OfertaTipo getTipo() {
		return this.tipo;
	}

	@Override
	public int compareTo(Oferta otraOferta) {
		if (this instanceof Promocion && otraOferta instanceof Excursion) {
			return -1;
		} else if (this instanceof Excursion && otraOferta instanceof Promocion) {
			return 1;
		} else if (this.getCosto() > otraOferta.getCosto()) {
			return -1;
		} else if (this.getCosto() < otraOferta.getCosto()) {
			return 1;
		} else if (this.getTiempo() > otraOferta.getTiempo()) {
			return -1;
		} else if (this.getTiempo() < otraOferta.getTiempo()) {
			return 1;
		}
		return 0;
	}
	
	public Boolean getSoft_delete() {
		return soft_delete;
	}

	public void setSoft_delete(Boolean soft_delete) {
		this.soft_delete = soft_delete;
	}

	public abstract Integer getTiempo();

	public abstract Double getCosto();

	public abstract Integer getCupo();

	public abstract void venderCupo();

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public Integer getId() {
		return this.id;
	}

}