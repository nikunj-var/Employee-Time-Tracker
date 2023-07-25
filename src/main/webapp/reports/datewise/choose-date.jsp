<%@page import="java.time.LocalDate"%>
<%@ include file="../../navbar.jsp" %>
<html>
  <body onload="makeActive('datewise')">
  
  <div class='dvv'>
    <label class='lahu'>View date wise report</label>
  </div>
   <table class='ta'>
    <tr>
     <td class='pd'>
      <form action='current-date.jsp' method="post">
       <table class='cdta'>
        <tr>
         <td>Current date</td>
         <td align="right"><button class='cdbt'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
    <tr>
     <td class='pd'>
      <form action='any-date.jsp' method="post">
       <table class='cdta'>
        <tr>
         <td>Any date</td>
         <td><input type='date'  class='tb' name='date' style='width:15vw' required></td>
         <td align="right"><button class='cdbt'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
    <tr>
     <td class='pd'>
      <form action="date-between.jsp" method="post">
       <table class='cdta'>
        <tr>
         <td>Date between&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td><input type='date'class='tb' id='date1' name="date1" style='width:15vw' required></td>
         <td><input type='date' class='tb' id='date2' name="date2" style='width:15vw' required></td>
         <td align="right"><button class='cdbt' onclick='return compareDate()'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
   </table>
 </body>
</html>