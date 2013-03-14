package itm;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Stack;

/**
 * ConversationBean es una clase para representar objetos mensaje
 * Es útil para poder insertar conversaciones desde una página JSP con la notación ${conversacion.atributo}
 * La estructura de datos que usa es una cola LIFO mediante un objeto Stack. Así, el último mensaje añadido es el primero en extraerse.
 * Eso es útil para organizar la vista de conversaciones, mostrando primero el último mensaje enviado
 */
public class ConversationBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private static final SimpleDateFormat timestampFormat = new SimpleDateFormat("dd / MM / yyyy - HH:mm");
	
	// La id de conversación coincide con la id del mensaje primero
	private Long id;
	private long self_user_id;
	private UserBean other_user_bean;
	private Date timestamp;
	private String last_summary;
	private String stimestamp;
	
	// Usamos Stack porque es una cola LIFO last in first out
	private List<MessageBean> messages; //Objeto mensaje de respuesta a este mensaje

	// Constructor
	
	public ConversationBean( long self_user_id, UserBean other_user_bean ) {
		//System.out.println("Nueva conversación creada");
		messages = new ArrayList<MessageBean>();
		this.self_user_id = self_user_id;
		this.other_user_bean = other_user_bean;
		this.last_summary = "";
	}
	public ConversationBean( long self_user_id, UserBean other_user_bean, MessageBean mensaje_primero ) {
		//System.out.println("Nueva conversación creada con id " + mensaje_primero.getId());
		messages = new ArrayList<MessageBean>();
	    addMessage(mensaje_primero);
		this.self_user_id = self_user_id;
		this.other_user_bean = other_user_bean;
		this.setTimestamp( mensaje_primero.getTimestamp() );
		this.last_summary = mensaje_primero.getSummary();
	}
	
	public List<MessageBean> getMessages() {
		return messages;
	}
	public void setMessages(Stack<MessageBean> messages) {
		this.messages = messages;
	}
	public void addMessage(MessageBean message) {
		if (this.id == null && message.getId() != -1)
			this.id = message.getId();
		messages.add(0,message);
		this.setTimestamp( message.getTimestamp() );
		this.last_summary = message.getSummary();
		//System.out.println("Mensaje "+message.getId()+"añadido a la conversación "+ id);
	}

	
    public String getStimestamp() {
		return stimestamp;
	}
	public void setStimestamp(String stimestamp) {
		this.stimestamp = stimestamp;
	}
	public String getLast_summary() {
		return last_summary;
	}
	public void setLast_summary(String last_summary) {
		this.last_summary = last_summary;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
		if (timestamp != null)
			this.stimestamp = timestampFormat.format( timestamp );
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public long getSelf_user_id() {
		return self_user_id;
	}
	public void setSelf_user_id(long self_user_id) {
		this.self_user_id = self_user_id;
	}
	public UserBean getOther_user_bean() {
		return other_user_bean;
	}
	public void setOther_user_bean(UserBean other_user_bean) {
		this.other_user_bean = other_user_bean;
	}
	
	// Object overrides ---------------------------------------------------------------------------
	
	
	
	/**
     * The user ID is unique for each User. So this should compare User by ID only.
     * @see java.lang.Object#equals(java.lang.Object)
     */
	@Override
    public boolean equals(Object other) {
        return (other instanceof ConversationBean) && (id != null)
             ? id.equals(((ConversationBean) other).id)
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
