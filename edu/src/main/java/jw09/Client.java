package jw09;

/*
 * FileName : Client.java	
 * :: Client Á¤º¸¸¦ °®´Â Bean
 */
public class  Client{
	
	///Field
	private String name;
	private String addr;
	private int age;
	private String [] info = { "Á¶¼±","ÀÇÀû" };
	
	///Constructor
	public Client(){
		this.name = "È«±æµ¿";		
		this.addr ="ÇÑ¾ç";		
		this.age = 100;
		System.out.println("Client default Constructor È£ÃâµÊ");
	}

	///Method getter/setter
	public String getName(){	
		System.out.println("Client getName() È£ÃâµÊ");
		return this.name;
	}
	public String getAddr(){	
		System.out.println("Client getAddr() È£ÃâµÊ");
		return this.addr ;
	}
	public int	 getAge(){	
		System.out.println("Client getAge() È£ÃâµÊ");
		return this.age;
	}
	public String[] getInfo(){
		System.out.println("Client getInfo È£ÃâµÊ");
		return this.info;
	}
	public void setName(String name){	
		System.out.println("Client setName() È£ÃâµÊ");
		 this.name = name;
	}
	public void setAddr(String addr){	
		System.out.println("Client setAddr() È£ÃâµÊ");
		 this.addr = addr;
	}
	public void	 setAge(int age){	
		System.out.println("Client setAge() È£ÃâµÊ");
		 this.age = age;
	}
	public void setInfo(String[] info){
		System.out.println("Client setInfo È£ÃâµÊ");
		 this.info = info;
		 
	}
}
//ÀÌÀÌÀÌÀ×ÀÌÀÌÀÌÀÌÀÌÀÌÀ×ÀÌÀ×