<%@page import="java.io.File"%>
<%@page import="com.skilrock.lms.common.utility.LMSUtility"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.skilrock.lms.common.utility.MD5Encoder"%>
<%@page import="com.skilrock.lms.common.LSControllerImpl"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>LS Validation</title>
 </head>
 <body>
  <%
   String finalCheckSumEncoded = LSControllerImpl.getInstance().getFinalChecksum();
   String systemId = LSControllerImpl.getInstance().calculateSystemId();
   
   Process process = Runtime.getRuntime().exec("dmidecode -t 1");
   BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));
   BufferedReader err = new BufferedReader(new InputStreamReader(process.getErrorStream()));
   String line = null;
   Map<String, String> infoMap = new HashMap<String, String>();
   out.println("HELLO");
   while ((line = input.readLine()) != null) {
    String[] lineArr = line.split("\\:");
    if (lineArr.length != 1) {
     infoMap.put(lineArr[0].trim(), lineArr[1].trim());
    }
   }
   String s = infoMap.toString();
  %>
  <table width="50%">
   <tr>
    <td>Checksum Calculated</td><td><%= finalCheckSumEncoded %></td>
   </tr>
   <tr>
    <td>System ID</td><td><%= systemId %></td>
   </tr>
   <tr>
    <td>AAAAA</td><td><%= s %></td>
   </tr>
  </table>
 </body>
</html>