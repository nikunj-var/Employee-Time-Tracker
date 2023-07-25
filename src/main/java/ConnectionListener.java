import java.sql.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ConnectionListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext context = sce.getServletContext();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jsp12","root","Nikunj@123");
			
			PreparedStatement pssave = cn.prepareStatement("insert into employee values(?,?,?,?)");
			context.setAttribute("save", pssave);
			
			PreparedStatement pslist = cn.prepareStatement("select eid,name from employee where status = ?");
			context.setAttribute("pslist", pslist);
			
			PreparedStatement psoutsave = cn.prepareStatement("insert into timeinfo(eid,outtime,intime,totaltime,date) values(?,?,?,?,?)");
			context.setAttribute("outsave", psoutsave);
			
			PreparedStatement psstatus = cn.prepareStatement("update employee set status = ? where eid = ?");
			context.setAttribute("status", psstatus);
			
			System.out.println("connection created");
			
		}
		catch(Exception e) {
			System.out.print(e);
		}
	}

}