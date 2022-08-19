package restful.client;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.model2.mvc.service.domain.User;

public class UserRestHttpClientApp {

	public static void main(String[] args) throws Exception {

//		get_getUser_JSONSimple();
		
//		get_getUser_CodeHaus();
		
//		post_login_JSONSimple();
		
//		post_login_CodeHaus();
		
//		post_addUser_JSONSimple();
		
//		post_addUser_CodeHaus();
		
//		post_checkDuplication_JSONSimple();
		
//		post_checkDuplication_CodeHaus();
		
//		get_logout();
		
//		get_updateUser_JSONSimple();
		
//		get_updateUser_CodeHaus();
		
//		post_updateUser_JSONSimple();
		
//		post_updateUser_CodeHaus();
		
//		get_listUser_JSONSimple();
		
//		get_listUser_CodeHaus();
		
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
		
		String uri = "http://127.0.0.1:8080/user/json/getUser/user01";
		
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

	public static void post_addUser_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/addUser";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject inputObj = new JSONObject();
		inputObj.put("userId", "test");
		inputObj.put("password", "1111");
		inputObj.put("userName", "testName");
		
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

	public static void post_addUser_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/addUser";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		User user = new User();
		user.setUserId("test");
		user.setPassword("1111");
		user.setUserName("testName");
		
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

	public static void post_checkDuplication_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/checkDuplication";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject inputObj = new JSONObject();
		inputObj.put("userId", "admin");
		
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
		System.out.println(jsonObj.get("result"));
		System.out.println(jsonObj.get("userId"));
	}

	public static void post_checkDuplication_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/checkDuplication";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		User user = new User();
		user.setUserId("admin");
		
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
		Map<String, Object> map = objectMapper.readValue(jsonValue, new TypeReference<Map<String, Object>>() {});
		System.out.println(map.get("result"));
		System.out.println(map.get("userId"));
		
	}

	public static void get_logout() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/logout";
		
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
	}

	public static void get_updateUser_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/updateUser/admin";
		
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

	public static void get_updateUser_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/updateUser/admin";
		
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
		User returnUser = objectMapper.readValue(jsonValue, User.class);
		System.out.println(returnUser);
	}
	
	public static void post_updateUser_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/updateUser";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject inputJson = new JSONObject();
		inputJson.put("userId", "test");
		inputJson.put("userName", "testName");
		inputJson.put("email", "qwer@qwer.qwer");
		inputJson.put("phone", "010-1234-1234");
		
		StringEntity entity = new StringEntity(inputJson.toString());
		httpPost.setEntity(entity);
		
		HttpResponse respone = httpClient.execute(httpPost);
		System.out.println(respone);
		
		HttpEntity responseEntity = respone.getEntity();
		String jsonValue = new BufferedReader(new InputStreamReader(responseEntity.getContent(), "UTF-8")).readLine();
		
		System.out.println(jsonValue);
		JSONObject jsonObject = (JSONObject)JSONValue.parse(jsonValue);
		System.out.println(jsonObject);
		
	}

	public static void post_updateUser_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/updateUser";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		User user = new User();
		user.setUserId("test");
		user.setUserName("testtest");
		user.setEmail("qwer@qwer.qwer");
		user.setPhone("010-1234-1234");
		
		ObjectMapper objectMapper = new ObjectMapper();
		String inputJson = objectMapper.writeValueAsString(user);
		
		StringEntity entity = new StringEntity(inputJson);
		httpPost.setEntity(entity);
		
		HttpResponse respone = httpClient.execute(httpPost);
		System.out.println(respone);
		
		HttpEntity responseEntity = respone.getEntity();

		User returnUser = objectMapper.readValue(new InputStreamReader(responseEntity.getContent(), "UTF-8"), User.class);
		System.out.println(returnUser);
		
	}

	public static void get_listUser_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/listUser";
		
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
	
	public static void get_listUser_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/user/json/listUser";
		
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
		Map<String, Object> map = objectMapper.readValue(jsonValue, new TypeReference<Map<String, Object>>() {});
		System.out.println(map);
		System.out.println(map.get("list"));
		System.out.println(map.get("search"));
		System.out.println(map.get("totalCount"));
		System.out.println(map.get("resultPage"));
	}

}
