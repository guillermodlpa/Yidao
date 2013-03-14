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

	
});