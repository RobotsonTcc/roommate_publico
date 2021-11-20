function startChatting(){
	var id_chat = document.getElementById('id_chat');
	var nome = document.getElementById('nome');
	var xmlhttp;
	if(window.XMLHttpRequest){ // IE7, FFox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else { // IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.open("POST", "messages?id_chat=" + id_chat.value + "&nome=" + nome.value, true);
	
	document.getElementById("icon-load").innerHTML = '<img src="imgs/loader.gif" border="0" alt="Carregando, guenta ai..."/>';
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState === 4 && xmlhttp.status === 200){
			if(xmlhttp.responseText.indexOf('Incorrect') !== -1 ){
				document.getElementById("icon-load").innerHTML = "<h4 style='color:red'>" + xmlhttp.responseText + "</h4>";
			} else {
				document.getElementById("result-data").innerHTML = '<h1>' + xmlhttp.responseText + '</h1>';
			}
		}
	};
	
	xmlhttp.send(null);
}

function addText(){
	var nome = document.getElementById('u').value;
	var msg = document.getElementById('h').value;
	olist = document.getElementById('list');
	op = document.createElement('p');
	op.innerHTML = nome + "- <g>" + msg + "</g>";
	ocontent = document.getElementById('content');
	ocontent.appendChild(op); //linha nova
	olist.scrollTop = olist.scrollHeight;
	document.getElementById('h').value = '';
	var xmlhttp;
	
	if (window.XMLHttpRequest){// IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else{// IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
	
	xmlhttp.open("POST", "messagestore?nome=" + nome + "&msg=" + msg, true);

    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            document.getElementById("result").innerHTML = 'sent';
            document.getElementById("result").innerHTML = '';
        }
    };
    xmlhttp.send(null);
}

function reloadData(){
	var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }


    xmlhttp.open("POST", "reloaddata", true);

    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {

            document.getElementById("content").innerHTML = xmlhttp.responseText;
            olist = document.getElementById('list');
            olist.scrollTop = olist.scrollHeight;

        }


    };
    xmlhttp.send(null);
}