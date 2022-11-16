package library;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/resetpwd")
public class ChangePwdServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String old = req.getParameter("oldpwd");
        String newpwd = req.getParameter("pwd");
                
        HttpSession session = req.getSession();
        String userid = session.getAttribute("userid").toString();
        try {
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE userid=? and pwd=?");
            ps.setString(1, userid);
            ps.setString(2, old);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ps = con.prepareStatement("UPDATE users SET pwd=? WHERE userid=?");
                ps.setString(1, newpwd);
                ps.setString(2, userid);
                ps.executeUpdate();
                con.close();
                session.setAttribute("msg", "Password changed successfully..!!");
                resp.sendRedirect("ChangePwd.jsp");
            } else {
                session.setAttribute("error", "Incorrect Password..!!");
                resp.sendRedirect("ChangePwd.jsp");
            }
        } catch (Exception ex) {
            System.err.println("Error "+ex.getMessage());
        }
    }

}
