<%@ include file="../../navbar.jsp" %>
<html>
 <body onload="makeActive('out')">
 <form action="record-outtime.jsp">
  <div class='dv'>
   <label class='hdu'>Record employee out time</label>
  </div>
  <div class='dv'>
   <select name="eid" id="eid" class='la' onchange="checkEmployee(this)">
   	 <option value="-1">Select Employee</option>
   	 <%
	   	PreparedStatement ps = (PreparedStatement)application.getAttribute("pslist");
	   	ps.setString(1,"in");
	   	ResultSet rst = ps.executeQuery();
	   	while(rst.next()){
   		%>
   		<option value="<%=rst.getString(1) %>"><%=rst.getString(2)%>(<%=rst.getString(1) %>)</option>
   		<% 
   	}
   	
   %>
   </select>
   
  </div>
  <div class='dv'>
   <button disabled id='bt' class='btn btn-primary'>Submit</button>
  </div>
  <div class='dvv' id='msg'>
  </div> 
 </form> 
 </body>
</html>