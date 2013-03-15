$(document).ready(function(){
	
	/**
	 * INTERACCIÓN CON CONVERSACIONES
	 */
	$('.conversation button').toggle(
		function(){
			$(this).addClass('hide-button').removeClass('show-button').append('Plegar conversación');
			$(this).closest('.conversation').addClass('conversation-opened').removeClass('conversation-closed');
			$(this).closest('.conversation').children('.summary').addClass('hidden');
		},function(){
			$(this).addClass('show-button').removeClass('hide-button').empty();
			$(this).closest('.conversation').addClass('conversation-closed').removeClass('conversation-opened');
			$(this).closest('.conversation').children('.summary').removeClass('hidden');
	});
	
	/**
	 * ENVÍO DE MENSAJES DESDE EL PERFIL
	 */
	$('#send-button, #profile-send').click(
		function(){
			$('#new-message-box').removeClass('hidden');
			$('#send-button, #profile-send').addClass('hidden');
		}
	);
	$('#new-message-close').click(
		function(){
			$('#new-message-box').addClass('hidden');
			$('#send-button, #profile-send').removeClass('hidden');
		}
	);
	
	/**
	 * INTERFAZ DE CUENTA
	 */
	var changes = false;
	var unsaved_message = "Los cambios no se guardarán";
	
	$('#settings-profile-button').click(function(){
		if (changes && !confirm(unsaved_message) ) return; /* Si ha habido cambios y da a cancelar en el popup, no hacemos nada */
		$('#settings-learn-view, #settings-teach-view, #settings-notif-view, #settings-data-view, #settings-password-view').addClass('hidden');    
		$('#settings-profile-view').removeClass('hidden');
		changes = false;
	});
	$('#settings-learn-button').click(function(){
		if (changes && !confirm(unsaved_message) ) return;
		$('#settings-profile-view, #settings-teach-view, #settings-notif-view, #settings-data-view, #settings-password-view').addClass('hidden');    
		$('#settings-learn-view').removeClass('hidden');
		changes = false;
	});
	$('#settings-teach-button').click(function(){
		if (changes && !confirm(unsaved_message) ) return;
		$('#settings-learn-view, #settings-profile-view, #settings-notif-view, #settings-data-view, #settings-password-view').addClass('hidden');     
		$('#settings-teach-view').removeClass('hidden');
		changes = false;
	});
	$('#settings-notif-button').click(function(){
		if (changes && !confirm(unsaved_message) ) return;
		$('#settings-learn-view, #settings-teach-view, #settings-profile-view, #settings-data-view, #settings-password-view').addClass('hidden');  
		$('#settings-notif-view').removeClass('hidden');
		changes = false;
	});
	$('#settings-data-button').click(function(){
		if (changes && !confirm(unsaved_message) ) return;
		$('#settings-learn-view, #settings-teach-view, #settings-notif-view, #settings-profile-view, #settings-password-view').addClass('hidden');  
		$('#settings-data-view').removeClass('hidden');
		changes = false;
	});
	$('#settings-password-button').click(function(){
		if (changes && !confirm(unsaved_message) ) return;
		$('#settings-learn-view, #settings-teach-view, #settings-notif-view, #settings-data-view, #settings-profile-view').addClass('hidden');  
		$('#settings-password-view').removeClass('hidden');
		changes = false;
	});
	
	/* Función para notificar cuando ha habido una modificación en los inputs */
	$('.settings-view input').keyup(function() {
		changes = true;
	});
	$('.settings-view :checkbox').click(function() {
		changes = true;
	});

	
});