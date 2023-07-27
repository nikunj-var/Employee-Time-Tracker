<%@page import="java.time.LocalDate"%>
<%@ include file='../../navbar.jsp' %>
<html>
 <body onload='makeActive("datewise")'>
	<%
	PreparedStatement ps = (PreparedStatement)application.getAttribute("dateb");
	String date1 = request.getParameter("date1");
	String date2 = request.getParameter("date2");
	LocalDate ld1 = LocalDate.parse(date1);
	LocalDate ld2 = LocalDate.parse(date2);
	ps.setObject(1,ld1);
	ps.setObject(2,ld2);
	ResultSet rst = ps.executeQuery();
	%>
  <div class='dvv'>
     <label class='hdu'>Report of date from <%=date1%> and <%=date2%></label>
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