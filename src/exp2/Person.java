package exp2;

/**
 * 用来存一个人的信息，包括id、姓名、年龄、国籍
 * @author Alan
 *
 */
public class Person {
	
	private int id = -1;
	private String name = "";
	private int age = -1;
	private String country = "";
	private String introduction = "";

	/**
	 * 设置id
	 * @param id 
	 */
	public void setId(int id) { this.id = id; }
	/**
	 * 设置姓名
	 * @param name 姓名
	 */
	public void setName(String name) { this.name = name; }
	/**
	 * 设置年龄
	 * @param age 年龄
	 */
	public void setAge(int age) { this.age = age; }
	/**
	 * 设置国籍
	 * @param name 国籍
	 */
	public void setCountry(String country) { this.country = country; }
	/**
	 * 设置简介
	 * @param introduction 简介
	 */
	public void setIntroduction(String introduction) { this.introduction = introduction; }
	/**
	 * 获取id
	 * @return 人物的id
	 */
	public int getId() { return id; }
	/**
	 * 获取姓名
	 * @return 人物的姓名
	 */
	public String getName() { return name; }
	/**
	 * 获取年龄
	 * @return 年龄
	 */
	public int getAge() { return age; }
	/**
	 * 获取国籍
	 * @return 国籍
	 */
	public String getCountry() { return country; }
	/**
	 * 获取简介
	 * @return 简介
	 */
	public String getIntroduction() { return "".equals(introduction)?"":introduction; }
}
