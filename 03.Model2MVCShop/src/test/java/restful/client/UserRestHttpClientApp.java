package restful.client;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.model2.mvc.service.domain.User;

public class UserRestHttpClientApp {

	public static void main(String[] args) throws Exception {

//		get_getUser_JSONSimple();
		
//		get_getUser_CodeHaus();
		
//		post_login_JSONSimple();
		
//		post_login_CodeHaus();
		
	}
	
	public static void get_getUser_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/getUser/admin";
		
		HttpGet httpGet = new HttpGet(uri);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		HttpResponse response = httpClient.execute(httpGet);
		System.out.println(response);
		
		HttpEntity responseEntity = response.getEntity();
		InputStream is = responseEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		String jsonValue = br.readLine();
		
		System.out.println(jsonValue);
		JSONObject jsonObj = (JSONObject)JSONValue.parse(jsonValue);
		System.out.println(jsonObj);
	}
	
	public static void get_getUser_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/getUser/admin";
		
		HttpGet httpGet = new HttpGet(uri);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		HttpResponse response = httpClient.execute(httpGet);
		System.out.println(response);
		
		HttpEntity responseEntity = response.getEntity();
		InputStream is = responseEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		String jsonValue = br.readLine();
		
		System.out.println(jsonValue);
		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonValue, User.class);
		System.out.println(user);
	}

	public static void post_login_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/login";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject inputObj = new JSONObject();
		inputObj.put("userId", "admin");
		inputObj.put("password", "1234");
		
		StringEntity entity = new StringEntity(inputObj.toString());
		httpPost.setEntity(entity);
		
		HttpResponse response = httpClient.execute(httpPost);
		System.out.println(response);
		
		HttpEntity responseEntity = response.getEntity();
		InputStream is = responseEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		String jsonValue = br.readLine();
		
		System.out.println(jsonValue);
		JSONObject jsonObj = (JSONObject)JSONValue.parse(jsonValue);
		System.out.println(jsonObj);
	}

	public static void post_login_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/login";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		User user = new User();
		user.setUserId("admin");
		user.setPassword("1234");
		
		ObjectMapper objectMapper = new ObjectMapper();
		String inputValue = objectMapper.writeValueAsString(user);
		
		StringEntity entity = new StringEntity(inputValue);
		httpPost.setEntity(entity);
		
		HttpResponse response = httpClient.execute(httpPost);
		System.out.println(response);
		
		HttpEntity responseEntity = response.getEntity();
		InputStream is = responseEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		String jsonValue = br.readLine();
		
		System.out.println(jsonValue);
		User returnUser = objectMapper.readValue(jsonValue, User.class);
		System.out.println(returnUser);
		
	}
	
}