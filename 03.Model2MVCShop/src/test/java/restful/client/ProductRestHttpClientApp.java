package restful.client;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.model2.mvc.service.domain.Product;

public class ProductRestHttpClientApp {
	
	public static void main(String[] args) throws Exception {
		
//		post_addProduct_JSONSimple();
		
//		post_addProduct_CodeHaus();
		
//		post_updateProduct_JSONSimple();
		
//		post_updateProduct_CodeHaus();
		
	}
	
	public static void post_addProduct_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/product/json/addProduct";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept","application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject inputObj = new JSONObject();
		inputObj.put("prodName", "RestApp");
		inputObj.put("prodDetail", "RestTest");
		inputObj.put("price", "55555");
		inputObj.put("manuDate", "20220819");
		
		StringEntity entity = new StringEntity(inputObj.toString(), "UTF-8");
		httpPost.setEntity(entity);
		
		HttpResponse response = httpClient.execute(httpPost);
		System.out.println(response);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
		
		JSONObject jsonObject = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonObject);
		
	}
	
	public static void post_addProduct_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/product/json/addProduct";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept","application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Product product = new Product();
		product.setProdName("RestApp");
		product.setProdDetail("RestTest");
		product.setPrice(5555);
		product.setManuDate("20220819");
		ObjectMapper objectMapper = new ObjectMapper();
		String inputValue = objectMapper.writeValueAsString(product);
		
		StringEntity entity = new StringEntity(inputValue, "UTF-8");
		httpPost.setEntity(entity);
		
		HttpResponse response = httpClient.execute(httpPost);
		System.out.println(response);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
		
		product = objectMapper.readValue(br, Product.class);
		System.out.println(product);
		
	}

	public static void post_updateProduct_JSONSimple() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/product/json/updateProduct";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept","application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject inputObj = new JSONObject();
		inputObj.put("prodNo", 10013);
		inputObj.put("prodName", "RestApp");
		inputObj.put("prodDetail", "RestTest22");
		inputObj.put("price", 1234);
		inputObj.put("manuDate", "20220820");
		
		StringEntity entity = new StringEntity(inputObj.toString(), "UTF-8");
		httpPost.setEntity(entity);
		
		HttpResponse response = httpClient.execute(httpPost);
		System.out.println(response);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
		
		JSONObject jsonObject = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonObject);
		
	}

	public static void post_updateProduct_CodeHaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String uri = "http://127.0.0.1:8080/product/json/updateProduct";
		
		HttpPost httpPost = new HttpPost(uri);
		httpPost.setHeader("Accept","application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Product product = new Product();
		product.setProdNo(10013);
		product.setProdName("RestApp");
		product.setProdDetail("RestTest");
		product.setPrice(5555);
		product.setManuDate("20220819");
		
		ObjectMapper objectMapper = new ObjectMapper();
		String inputValue = objectMapper.writeValueAsString(product);
		
		StringEntity entity = new StringEntity(inputValue, "UTF-8");
		httpPost.setEntity(entity);
		
		HttpResponse response = httpClient.execute(httpPost);
		System.out.println(response);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
		
		product = objectMapper.readValue(br, Product.class);
		System.out.println(product);
		
	}
	
}
