package itm;

import java.io.Serializable;
import java.util.Date;

/**
 * UserBean es una clase para representar objetos usuario
 * Es útil para poder insertar usuarios desde una página JSP con la notación ${usuario.atributo}
 * El atributo valid es especialmente importante porque indica si el usuario existe en la base de datos (usado para login)
 */
public class UserBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**
	 * Atributo que identifica el nombre de imagen por defecto a mostrar para identificar al usuario
	 */
	private static final String DEFAULT_PIC_NAME = "a";
	
	private boolean valid;
	
	private Long id;
	private String username;
    private String password;
    
	private String firstName;
    private String lastName;
    private String region;
    private String bio;
    private Date birthday;
    private int nreferences;
    private String picture;
    
    private String teach1_title;
    private String teach1_text;
    private String teach2_title;
    private String teach2_text;
    private String teach3_title;
    private String teach3_text;
    private String teach4_title;
    private String teach4_text;
    private String teach5_title;
    private String teach5_text;
    private String teach6_title;
    private String teach6_text;
    private String learn1_title;
    private String learn1_text;
    private String learn2_title;
    private String learn2_text;
    private String learn3_title;
    private String learn3_text;
    private String learn4_title;
    private String learn4_text;
    private String learn5_title;
    private String learn5_text;
    private String learn6_title;
    private String learn6_text;
    
    
    public static String getDefaultPicName(){
    	return DEFAULT_PIC_NAME;
    }
    public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getNreferences() {
		return nreferences;
	}
	public void setNreferences(int nreferences) {
		this.nreferences = nreferences;
	}
	public String getPassword() {
		return password;
	}
    public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTeach4_title() {
		return teach4_title;
	}
	public void setTeach4_title(String teach4_title) {
		this.teach4_title = teach4_title;
	}
	public String getTeach4_text() {
		return teach4_text;
	}
	public void setTeach4_text(String teach4_text) {
		this.teach4_text = teach4_text;
	}
	public String getTeach5_title() {
		return teach5_title;
	}
	public void setTeach5_title(String teach5_title) {
		this.teach5_title = teach5_title;
	}
	public String getTeach5_text() {
		return teach5_text;
	}
	public void setTeach5_text(String teach5_text) {
		this.teach5_text = teach5_text;
	}
	public String getTeach6_title() {
		return teach6_title;
	}
	public void setTeach6_title(String teach6_title) {
		this.teach6_title = teach6_title;
	}
	public String getTeach6_text() {
		return teach6_text;
	}
	public void setTeach6_text(String teach6_text) {
		this.teach6_text = teach6_text;
	}
	public String getLearn4_title() {
		return learn4_title;
	}
	public void setLearn4_title(String learn4_title) {
		this.learn4_title = learn4_title;
	}
	public String getLearn4_text() {
		return learn4_text;
	}
	public void setLearn4_text(String learn4_text) {
		this.learn4_text = learn4_text;
	}
	public String getLearn5_title() {
		return learn5_title;
	}
	public void setLearn5_title(String learn5_title) {
		this.learn5_title = learn5_title;
	}
	public String getLearn5_text() {
		return learn5_text;
	}
	public void setLearn5_text(String learn5_text) {
		this.learn5_text = learn5_text;
	}
	public String getLearn6_title() {
		return learn6_title;
	}
	public void setLearn6_title(String learn6_title) {
		this.learn6_title = learn6_title;
	}
	public String getLearn6_text() {
		return learn6_text;
	}
	public void setLearn6_text(String learn6_text) {
		this.learn6_text = learn6_text;
	}
	
    
    
    public String getTeach1_title() {
		return teach1_title;
	}
	public void setTeach1_title(String teach1_title) {
		this.teach1_title = teach1_title;
	}
	public String getTeach1_text() {
		return teach1_text;
	}
	public void setTeach1_text(String teach1_text) {
		this.teach1_text = teach1_text;
	}
	public String getTeach2_title() {
		return teach2_title;
	}
	public void setTeach2_title(String teach2_title) {
		this.teach2_title = teach2_title;
	}
	public String getTeach2_text() {
		return teach2_text;
	}
	public void setTeach2_text(String teach2_text) {
		this.teach2_text = teach2_text;
	}
	public String getTeach3_title() {
		return teach3_title;
	}
	public void setTeach3_title(String teach3_title) {
		this.teach3_title = teach3_title;
	}
	public String getTeach3_text() {
		return teach3_text;
	}
	public void setTeach3_text(String teach3_text) {
		this.teach3_text = teach3_text;
	}
	public String getLearn1_title() {
		return learn1_title;
	}
	public void setLearn1_title(String learn1_title) {
		this.learn1_title = learn1_title;
	}
	public String getLearn1_text() {
		return learn1_text;
	}
	public void setLearn1_text(String learn1_text) {
		this.learn1_text = learn1_text;
	}
	public String getLearn2_title() {
		return learn2_title;
	}
	public void setLearn2_title(String learn2_title) {
		this.learn2_title = learn2_title;
	}
	public String getLearn2_text() {
		return learn2_text;
	}
	public void setLearn2_text(String learn2_text) {
		this.learn2_text = learn2_text;
	}
	public String getLearn3_title() {
		return learn3_title;
	}
	public void setLearn3_title(String learn3_title) {
		this.learn3_title = learn3_title;
	}
	public String getLearn3_text() {
		return learn3_text;
	}
	public void setLearn3_text(String learn3_text) {
		this.learn3_text = learn3_text;
	}
	
    
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public Long getId(){
		return id;
	}
	public void setId(Long id){
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	// Object overrides ---------------------------------------------------------------------------

    /**
     * The user ID is unique for each User. So this should compare User by ID only.
     * @see java.lang.Object#equals(java.lang.Object)
     */
	@Override
    public boolean equals(Object other) {
        return (other instanceof UserBean) && (id != null)
             ? id.equals(((UserBean) other).id)
             : (other == this);
    }
	 /**
     * The user ID is unique for each User. So User with same ID should return same hashcode.
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        return (id != null) 
             ? (this.getClass().hashCode() + id.hashCode()) 
             : super.hashCode();
    }
    

}
