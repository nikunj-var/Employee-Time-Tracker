<%@ page import ="com.cetpa.TimeUtility" %>
<%@ page import ="java.time.LocalDate" %>
<%@ include file="../../navbar.jsp" %>
<html>
 <body onload="makeActive('in')">
  	
 	<%
 		/* Code to record out time */
 		String eid = request.getParameter("eid");
 		
 		String intime = TimeUtility.getCurrentTime();
 		
 		PreparedStatement ps1 = (PreparedStatement)application.getAttribute("outtime");
 		ps1.setString(1, eid);
 		ResultSet rst = ps1.executeQuery();
 		rst.next();
 		
 		String outtime = rst.getString(1);
 		
 		
 		
 		PreparedStatement ps = (PreparedStatement)application.getAttribute("inupdate");
 		
 		
 		ps.setString(1,intime);
 		ps.setString(2,TimeUtility.getTotalTime(intime,outtime));
 		ps.setString(3,eid);
 		
 		ps.executeUpdate();
 		
 		/* code to change status of employee */
 		PreparedStatement ps2 = (PreparedStatement)application.getAttribute("status");
 		ps2.setString(1, "in");
 		ps2.setString(2, eid);
 		ps2.executeUpdate();
 	%>
  <div class='dv'>
   <label class='lah' style='color:green'>Employee(<%=request.getParameter("eid")%>) In time has been updated</label>
  </div>
 </body>
</html>