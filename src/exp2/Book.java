package exp2;

/**
 * 用来存一本书的信息的类，包括isbn码、书名、作者、出版社、出版日期、价格
 * 其中isbn不为空
 * @author Alan
 *
 */
public class Book {
	
	private String isbn = "";
	private String name = "";
	private int author = -1;
	private String press = "";
	private int publicationDate = -1;
	private int price = -1;
	private String introduction = "";

	/**
	 * 设置书的isbn码
	 * @param isbn 注意是字符串，不是数字
	 */
	public void setIsbn(String isbn) { this.isbn = isbn; }
	/**
	 * 设置书名（默认为空字符串""）
	 * @param name
	 */
	public void setName(String name) { this.name = name; }
	/**
	 * 设置作者（默认为-1，表示未知）
	 * @param author 作者在Author表的ID
	 */
	public void setAuthor(int author) { this.author = author; }
	/**
	 * 设置出版社（默认为空字符串""）
	 * @param press
	 */
	public void setPress(String press) { this.press = press; }
	/**
	 * 设置出版时间（默认为-1， 表示未知）
	 * @param publicationDate 一个6位整数，格式为yyyymm（比如2016年7月应写为201607），方法内部不会对数值的合法性进行判断
	 */
	public void setPublicationDate(int publicationDate) { this.publicationDate = publicationDate; }
	/**
	 * 设置图书价格（默认为-1，表示未知）
	 * @param price 类型为整数，单位是分
	 */
	public void setPrice(int price){ this.price = price; }
	/**
	 * 设置简介
	 * @param introduction
	 */
	public void setIntroduction(String introduction) { this.introduction = introduction; }
	/**
	 * 获取书的isbn码
	 * @return 书的isbn码 
	 */
	public String getIsbn() { return isbn; }
	/**
	 * 获取书名
	 * @return 书名（若没有书名，则为空字符串""）
	 */
    public String getName() { return name; }
    /**
     * 获取作者的ID
     * @return 作者的ID（若没有作者，则为-1）
     */
    public int getAuthor() { return author; }
    /**
     * 获取出版社
     * @return 出版社（若没有出版社，则为空字符串""）
     */
    public String getPress() { return press; }
    /**
     * 获取出版时间
     * @return 出版时间，一个6位整数，格式为yyyymm（比如2016年7月应写为201607）；若没有出版时间，则返回-1
     */
    public int getPublicationDate() { return publicationDate; }
    /**
	 * 获取图书价格（默认为-1，表示未知）
	 * @return price 类型为整数，单位是分
	 */
	public int getPrice(){ return price; }
	/**
	 * 获取简介
	 * @return introduction
	 */
	public String getIntroduction() { return "".equals(introduction)?"":introduction; }
}
