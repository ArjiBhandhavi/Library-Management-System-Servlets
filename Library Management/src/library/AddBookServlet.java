package library;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/addbook")
public class AddBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bname = req.getParameter("bname");
        String price = req.getParameter("price");
        String author = req.getParameter("author");
        String descr = req.getParameter("descr");
        String publisher = req.getParameter("publisher");
        String isbn = req.getParameter("isbn");
        
        try {
            Connection con = DbConfig.connect();
            
            PreparedStatement ps = con
                    .prepareStatement("insert into books(bname,author,publisher,isbn,price,descr,status,createdon) "
                    		+ "values(?,?,?,?,?,?,'Available',now())");
            ps.setString(1, bname);
            ps.setString(2, author);
            ps.setString(3, publisher);
            ps.setString(4, isbn);
            ps.setString(5, price);
            ps.setString(6, descr);
            
            ps.executeUpdate();
            con.close();

            HttpSession session=req.getSession();
            session.setAttribute("msg", "Book added successfully");
            resp.sendRedirect("books.jsp");

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
	}
}
