function see(evt, element) {
	var x = document.getElementsByClassName("management");
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";  
		x[i].style.fontWeight = "normal";  
		x[i].style.textDecoration = "none";  
	}
	x = document.getElementsByClassName("sidebar_management");
	for (i = 0; i < x.length; i++) {
		x[i].style.fontWeight = "normal";  
		x[i].style.textDecoration = "none";  
	}

	document.getElementById(element).style.display = "block";
	document.getElementById(element+"_link").style.fontWeight = "bold";  
	document.getElementById(element+"_link").style.textDecoration  = "underline";   
	
}
function read_message(r) {
	var x = document.getElementsByClassName("management");
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";  
		x[i].style.fontWeight = "normal";  
		x[i].style.textDecoration = "none";  
	}
	x = document.getElementsByClassName("sidebar_management");
	for (i = 0; i < x.length; i++) {
		x[i].style.fontWeight = "normal";  
		x[i].style.textDecoration = "none";  
	}

	/*Linha clicada*/
	var i = r.parentNode.parentNode.rowIndex;
	message_id=document.getElementById("futebol_notificacoes").rows[i].cells[0].innerHTML;
	location.replace("php_functions/notifications.php?f=read_notification&message_id="+message_id);
}

function show_user_details(r) {
	var x = document.getElementsByClassName("management");
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";  
		x[i].style.fontWeight = "normal";  
		x[i].style.textDecoration = "none";  
	}
	x = document.getElementsByClassName("sidebar_management");
	for (i = 0; i < x.length; i++) {
		x[i].style.fontWeight = "normal";  
		x[i].style.textDecoration = "none";  
	}

	/*Linha clicada*/
	var i = r.parentNode.parentNode.rowIndex;
	user_id=document.getElementById("futebol_users").rows[i].cells[0].innerHTML;
	location.replace("php_functions/list_user_details.php?user_id="+user_id);
}

function demote_managers(r){
	//TODO:Garantir que o nome do torneio e o nome do utilizador não tem ; nem | 
	var x = document.querySelectorAll("[name=privilegios_gestor]");
	var users="";

	for (i = 0; i < x.length; i++) {
		if(x[i].checked){
			var res = (x[i].id).split(";");
			if(res[0].valueOf() == "tirar"){	
				users += res[1]+";"+res[2]+"|";
			}
		}
	}
	users = users.slice(0, -1);
	location.replace("php_functions/admin_functions.php?f=demote_managers&info="+users);
}


function promote_managers(torneio){
	var x = document.querySelectorAll("[name=privilegios_gestor]");
	var users=torneio+"|";
	for (i = 0; i < x.length; i++) {
		if(x[i].checked){
			var res = (x[i].id).split(";");
			if(res[0].valueOf() == "dar"){	
				users += res[1]+";";
			}
		}
	}
	users = users.slice(0, -1);
	location.replace("php_functions/admin_functions.php?f=promote_managers&info="+users);
	
}

function delete_user(r) {
	var i = r.parentNode.parentNode.rowIndex;
	user_id=document.getElementById("futebol_users").rows[i].cells[0].innerHTML;
	if (confirm("Confirme remoção de utilizador?")) {
		document.getElementById("futebol_users").deleteRow(i);
		// apaga o utilizador da BD
		location.replace("php_functions/admin_functions.php?f=remove_user&user_id="+user_id);
		
	} else {
		//alert("I am an alert box!");
	}
}
