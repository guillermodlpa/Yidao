package itm;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * MessageBean es una clase para representar objetos mensaje
 * Es útil para poder insertar mensajes desde una página JSP con la notación ${mensaje.atributo}
 */
public class MessageBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private static final SimpleDateFormat timestampFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
	private Long id;
	
	private long idReceiver;
	private long idSender;
	
	private int answerId;
	
	private String content;
	private String summary;   //primeras palabras del contenido
	private Date timestamp;
	private String stimestamp;
	

	
    public String getStimestamp() {
		return stimestamp;
	}
	public void setStimestamp(String stimestamp) {
		this.stimestamp = stimestamp;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public long getIdSender() {
		return idSender;
	}
	public void setIdSender(long idSender) {
		this.idSender = idSender;
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
		if (timestamp != null)
			this.stimestamp = timestampFormat.format( (java.util.Date)timestamp );
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getAnswerId() {
		return answerId;
	}
	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	
	// Object overrides ---------------------------------------------------------------------------
	
	
	/**
     * The user ID is unique for each User. So this should compare User by ID only.
     * @see java.lang.Object#equals(java.lang.Object)
     */
	@Override
    public boolean equals(Object other) {
        return (other instanceof MessageBean) && (id != null)
             ? id.equals(((MessageBean) other).id)
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
