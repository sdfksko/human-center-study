
<%
	int p = 0;
	try{
		p = Integer.parseInt(request.getParameter("p"));				
	}catch(Exception e){}

	int s = 5;
	try{
		s = Integer.parseInt(request.getParameter("s"));				
	}catch(Exception e){}
	
	int b = 5;
	try{
		b = Integer.parseInt(request.getParameter("b"));				
	}catch(Exception e){}

	int idx = 1;
	try{
		idx = Integer.parseInt(request.getParameter("idx"));				
	}catch(Exception e){}
	
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	request.setAttribute("p", p);
	request.setAttribute("s", s);
	request.setAttribute("b", b);
	request.setAttribute("idx", idx);
	request.setAttribute("title", title);
	request.setAttribute("name", name);
%>