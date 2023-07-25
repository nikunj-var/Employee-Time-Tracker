<%@page import="java.time.LocalDate"%>
<%@ include file='../../navbar.jsp' %>
<html>
 <body onload='makeActive("datewise")'>
 <%
 	PreparedStatement ps = (PreparedStatement)application.getAttribute("currentdate");
 	ps.setObject(1,LocalDate.now());
 	ResultSet rst = ps.executeQuery();
 %>
  
  <div class='dvv'>
     <label class='hdu'>Report of current date</label>
  </div>
  <div class='container'>
   <div class='card mx-auto'>
     <div class='card-body'>
      <div class='table scrollit'>
       <table class='table table-hover'>
        <thead>
         <tr>
          <th>S.No</th><th>Emp Id</th><th>Out Time</th><th>In Time</th><th>Total Time</th><th>Date</th>
         </tr> 
        </thead>
        <tbody>
        	<%	
        		int sn = 0;
        		while(rst.next()){
        			String intime = rst.getString(4);
        			%>
        				<tr>
        					<td><%= ++sn %></td>
        					<td><%= rst.getString(2) %></td>
        					<td><%= rst.getString(3) %></td>
        					<td style = "color:<%= intime.equals("Not in yet")?"red":"green"%>"><%= intime %></td>
        					<td><%= rst.getString(5) %></td>
        					<td><%= rst.getString(6) %></td>
        					
        				</tr>
        			<% 	
        		}
        	%>
        </tbody>
        </table>
     </div>
   </div> 
  </div>
  </div>
  
  <div style='text-align: center;margin-top:10px'>
   <input type='button' value='Back' onclick='history.back()' class='btr' style='background-color:orange'>
  </div>
 </body>
</html>