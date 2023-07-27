<%@page import="java.time.LocalDate"%>
<%@ include file='../../navbar.jsp' %>
<html>
 <body onload='makeActive("datewise")'>
	<%
	PreparedStatement ps = (PreparedStatement)application.getAttribute("date");
	String date = request.getParameter("date");
	LocalDate ld = LocalDate.parse(date);
	ps.setObject(1,ld);
	ResultSet rst = ps.executeQuery();
	%>
  <div class='dvv'>
     <label class='hdu'>Report of date <%=date%></label>
  </div>
  <div class='container'>
   <div class='card mx-auto'>
     <div class='card-body'>
     <%if(rst.next()){%>
      <div class='table scrollit'>
       <table class='table table-hover'>
        <thead>
         <tr>
          <th>S.No</th><th>Emp Id</th><th>Out Time</th><th>In Time</th><th>Total Time</th><th>Date</th>
         </tr> 
        </thead>
        <tbody>
        <%
        int sn=0;
        do
        {
        	String intime=rst.getString(4);
        	%>
        	<tr>
        	 <td><%=++sn%></td>
        	 <td><%=rst.getString(2)%></td>
        	 <td><%=rst.getString(3)%></td>
        	 <td style="color:<%=intime.equals("Not in yet")?"red":"green"%>"><%=intime%></td>
        	 <td><%=rst.getString(5)%></td>
        	 <td><%=rst.getString(6)%></td>
        	</tr>
        	<%
        }while(rst.next());
        %>
        </tbody>
       </table>
      </div>
      <%}else{
    	%>
    	<div style='text-align: center'>
    	 <label class='lah' style='color:red'>Sorry no record found</label>	
    	</div>
    	<%   
      }
      %>
     </div>
   </div> 
  </div>
  <div style='text-align: center;margin-top:10px'>
   <input type='button' value='Back' onclick='history.back()' class='btr' style='background-color:orange'>
  </div>
 </body>
</html>