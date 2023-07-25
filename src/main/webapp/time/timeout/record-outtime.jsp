<%@ page import ="com.cetpa.TimeUtility" %>
<%@ page import ="java.time.LocalDate" %>
<%@ include file="../../navbar.jsp" %>
<html>
 <body onload="makeActive('out')">
  	
 	<%
 		/* Code to record out time */
 		String eid = request.getParameter("eid");
 		PreparedStatement ps = (PreparedStatement)application.getAttribute("outsave");
 		ps.setString(1,eid);
 		ps.setString(2,TimeUtility.getCurrentTime());
 		ps.setString(3,"Not in yet");
 		ps.setString(4,"Not Applicable");
 		ps.setObject(5,LocalDate.now());
 		ps.executeUpdate();
 		
 		/* code to change status of employee */
 		PreparedStatement ps1 = (PreparedStatement)application.getAttribute("status");
 		ps1.setString(1, "out");
 		ps1.setString(2, eid);
 		ps1.executeUpdate();
 	%>
  <div class='dv'>
   <label class='lah' style='color:green'>Employee(<%=request.getParameter("eid")%>) out time has been recorded</label>
  </div>
 </body>
</html>