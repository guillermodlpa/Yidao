package itm;

import java.io.Serializable;
import java.util.Date;

/**
 * ReferenceBean es una clase para representar objetos referencia
 * Es útil para poder insertar referencias desde una página JSP con la notación ${referencia.atributo}
 */
public class ReferenceBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	private Long idReceiver;
	private UserBean sender;
	
	private boolean exchange;
	private String teach;
	private String learn;
	private String content;
	private Date timestamp;
	
	
    public UserBean getSender() {
		return sender;
	}
	public void setSender(UserBean sender) {
		this.sender = sender;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getIdReceiver() {
		return idReceiver;
	}
	public void setIdReceiver(Long idReceiver) {
		this.idReceiver = idReceiver;
	}
	public boolean isExchange() {
		return exchange;
	}
	public void setExchange(boolean exchange) {
		this.exchange = exchange;
	}
	public String getTeach() {
		return teach;
	}
	public void setTeach(String teach) {
		this.teach = teach;
	}
	public String getLearn() {
		return learn;
	}
	public void setLearn(String learn) {
		this.learn = learn;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
	// Object overrides ---------------------------------------------------------------------------
	
	
	/**
     * The user ID is unique for each User. So this should compare User by ID only.
     * @see java.lang.Object#equals(java.lang.Object)
     */
	@Override
    public boolean equals(Object other) {
        return (other instanceof ReferenceBean) && (id != null)
             ? id.equals(((ReferenceBean) other).id)
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
