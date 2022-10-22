package controller.excursions;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Excursion;
import services.ExcursionService;

@WebServlet("/edit-excursion.do")
public class EditarExcursionServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = -7343359082562184278L;
	private ExcursionService excursionService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.excursionService = new ExcursionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer id = Integer.parseInt(req.getParameter("id"));
		Excursion excursion = excursionService.find(id);
		req.setAttribute("excursion", excursion);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/excursion-editar.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		String nombre = req.getParameter("nombre");
		int tipo_oferta = Integer.parseInt(req.getParameter("tipo_oferta"));
		double costo = Double.parseDouble(req.getParameter("dinero"));
		Integer tiempo = Integer.parseInt(req.getParameter("tiempo"));		
		Integer cupo = Integer.parseInt(req.getParameter("cupo"));
		String descripcion = req.getParameter("descripcion");
		
		Part filePart = req.getPart("file");
		
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		InputStream fileContent = filePart.getInputStream();
		File ruta = new File("D://Proyectos/eclipse-workspace/TurismoSimpson-WEBAPP/src/main/webapp/img/offers");
		fileName = fileName.replace(" ", "_");
        File file = new File(ruta, fileName);
        Files.copy(fileContent, file.toPath());
		
		Excursion excursion = excursionService.update(id, nombre, costo, tiempo, cupo, tipo_oferta, fileName, descripcion);

		
		if (excursion.isValid()) {
			
			req.setAttribute("flash", "¡excursion editada exitosamente!");
			
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/adm-excursiones.do");
			dispatcher.forward(req, resp);
			
		} else {
			
			req.setAttribute("flash", "Ah ocurrido un error al editar usuario");

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/adm-excursiones.do");
			dispatcher.forward(req, resp);

		}
	}
	
}
