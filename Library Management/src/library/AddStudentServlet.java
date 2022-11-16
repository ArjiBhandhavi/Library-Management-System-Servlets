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


@WebServlet("/regstudent")
public class AddStudentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String gender = req.getParameter("gender");
        String pwd = req.getParameter("pwd");
        
        try {
        	String userid=DbConfig.generateStudentId();
            Connection con = DbConfig.connect();
            
            PreparedStatement ps = con
                    .prepareStatement("insert into students(name,address,phone,email,gender,active,createdon) "
                    		+ "values(?,?,?,?,?,1,now())");
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, gender);
            
            ps.executeUpdate();
            
            ps=con.prepareStatement("insert into users(userid,uname,role,pwd,id,createdon,active) "
            		+ "values(?,?,'Student',?,?,now(),1)");
            String studentid=String.format("Student%03d",DbConfig.getLastId());
            ps.setString(1,studentid);
            ps.setString(2,name);
            ps.setString(3,pwd);
            ps.setInt(4,DbConfig.getLastId());
            ps.executeUpdate();
            
            con.close();

            HttpSession session=req.getSession();
            session.setAttribute("msg", "Student registered successfully with id "+studentid);
            resp.sendRedirect("studentpage.jsp");

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
	}
}
