<%@ include file="../navbar.jsp" %>
<html>
 <body onload="makeActive('add')">
  <%
  
  PreparedStatement ps= (PreparedStatement)application.getAttribute("save");
 
  ps.setString(1,request.getParameter("eid"));
  
  ps.setString(2,request.getParameter("name"));
  ps.setString(3,request.getParameter("department"));
  ps.setString(4,"in");
  ps.executeUpdate();
  %>
  <div class='dv'>
   <label class='lah' style='color:green'>Employee record has been added</label>
  </div>
 </body>
</html>