<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Reservations</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			//Connection con = db.getConnection();		
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			
			System.out.println(type);
			
			String url = "jdbc:mysql://cs336.cshgvolhkift.us-east-2.rds.amazonaws.com:3306/cs336Project";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, "DhanushSG", "cs336project");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
		
			String str;
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			
			if(type.compareTo("customer")==0){
			str = "SELECT userid, seat_number, class, depart_time, arrive_time, total_fare, airline_id, flight_number, ticket_number, departure_id, destination_id FROM ticket JOIN trip USING (ticket_number) JOIN seat USING (seat_number,aircraft_id) JOIN flights USING (flight_number,airline_id,aircraft_id) WHERE userid="+"\'"+name+"\'"+" AND depart_time > NOW()";
			}else{
			str = "SELECT userid, seat_number, class, depart_time, arrive_time, total_fare, airline_id, flight_number, ticket_number, departure_id, destination_id FROM ticket JOIN trip USING (ticket_number) JOIN seat USING (seat_number,aircraft_id) JOIN flights USING (flight_number,airline_id,aircraft_id) WHERE flight_number="+"\'"+name+"\'"+" AND depart_time > NOW()";
			}
				
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table style=\"width:100%\">");
			//make a row
			out.print("<tr>");
			
			out.print("<th>");
			out.print("userid");
			out.print("</th>");
			out.print("<th>");
			out.print("seat_number");
			out.print("</th>");
			out.print("<th>");
			out.print("class");
			out.print("</th>");
			out.print("<th>");
			out.print("depart_time");
			out.print("</th>");
			out.print("<th>");
			out.print("arrive_time");
			out.print("</th>");
			out.print("<th>");
			out.print("total_fare");
			out.print("</th>");
			out.print("<th>");
			out.print("airline_id");
			out.print("</th>");
			out.print("<th>");
			out.print("flight_number");
			out.print("</th>");
			out.print("<th>");
			out.print("ticket_number");
			out.print("</th>");
			out.print("<th>");
			out.print("departure_id");
			out.print("</th>");
			out.print("<th>");
			out.print("destination_id");
			out.print("</th>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				
				out.print("<tr>");
		
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("userid"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("seat_number"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("class"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("depart_time"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("arrive_time"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("total_fare"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("airline_id"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("flight_number"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("ticket_number"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("departure_id"));
				out.print("</td>");
				out.print("<td style=\"text-align:center\" >");
				out.print(result.getString("destination_id"));
				out.print("</td>");

				
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>