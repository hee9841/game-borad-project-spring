<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> GAME WEB </title>
</head>
<body>
<%
	String clientId = "V5qQxANH24JTVqRJsCJ5";		// �� Ŭ���̾�Ʈ ���̵�
	String clientSecret = "V2lCbB0viA";				// �� Ŭ���̾�Ʈ ��ũ����
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://localhost:8282/login/naverCallback.do", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL += "client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL = "+apiURL);
    
    try {
    	URL url = new URL(apiURL);
    	HttpURLConnection con = (HttpURLConnection)url.openConnection();
    	con.setRequestMethod("GET");
    	int responseCode = con.getResponseCode();
    	BufferedReader br;
    	System.out.print("responseCode="+responseCode);
    	if(responseCode == 200) {		// ���� ȣ��
    		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
    	} else {						// ���� �߻�
    		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
    	}
    	String inputLine;
    	StringBuffer res = new StringBuffer();
    	while((inputLine = br.readLine()) != null) {
    		res.append(inputLine);
    	}
    	br.close();
    	if(responseCode == 200) {
    		out.println(res.toString());
    	}
    } catch(Exception e) {
    	System.out.println(e);
    }
%>
</body>
</html>