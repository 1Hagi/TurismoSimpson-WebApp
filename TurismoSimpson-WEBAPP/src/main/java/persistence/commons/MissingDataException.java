package persistence.commons;

public class MissingDataException extends RuntimeException {

	private static final long serialVersionUID = 6813697248809460369L;

	public MissingDataException(Exception e) {
		super(e);
	}

}
