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

@WebServlet("/issue")
public class IssueBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bid=req.getParameter("bid");
			String stdid=req.getParameter("stdid");
			
			Connection con=DbConfig.connect();
			PreparedStatement ps=con.prepareStatement("insert into btrans(bid,stdid,trandate,issue) value(?,?,now(),1)");
			ps.setString(1,bid);
			ps.setString(2,stdid);
			ps.executeUpdate();
			
			ps=con.prepareStatement("update books set status='Not Available' where bid=?");
			ps.setString(1,bid);
			ps.executeUpdate();
			
			con.close();
			HttpSession session=req.getSession();
			session.setAttribute("msg", "Book issued successfully");
			resp.sendRedirect("books.jsp");
					
		}
		catch(Exception ex) {
			
		}
	}
}
