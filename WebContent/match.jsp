  	<script src="https://kit.fontawesome.com/25fc58f537.js" crossorigin="anonymous"></script>
  	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  	
  	<style>

.tbg {
    height: 35em;
    width: 400px;
    background-color: rgb(64 64 64);
    margin: 0 auto;
    border: 1px solid #c0c0c0;
    border-radius: 10px;
}
.tbgwrap { padding: 10px; }

.theader { height: 65px; border-bottom: 1px solid #c0c0c0; }
.theader i.fa-comments {
    color: #c0c0c0;
    font-size: 40px;
    display: inline-block;
    float: right;
    padding: 10px 20px;
    position: relative;
}
.theader i.fa-cog {
    color: #c0c0c0;
    font-size: 40px;
    display: inline-block;
    float: left;
    padding: 10px 20px;
    position: relative;
}
.tlogo { width: 100px; margin: 0 auto; padding: 10px; }
.tlogo img { width: 100px; }
.tphoto {
    width: 350px;
    height: 350px;
    overflow: hidden;
    display: block;
    margin-left: auto;
    margin-right: auto;
    top: 15px;
    border-radius: 10px;
    -moz-border-radius: 10px;
    -o-border-radius: 10px;
    -ms-border-radius: 10px;
    border: 1px solid #c0c0c0;
    padding-bottom: 60px;
    background-color: #fff;
    box-shadow: 2px 2px 2px #c0c0c0;
}
.tphoto img {}
.tname {
    padding: 15px;
    font-size: 20px;
    font-family: 'Helvetica', sans-serif;
    text-align: center;
}
.tname .age { font-weight: 200; }
.tinfo { font-family: 'Helvetica', sans-serif; }
.tinfo .fa-users, .tinfo .fa-book {
    color: #c0c0c0;
    float: right;
    position: relative;
    font-size: 24px;
    padding: 12px;
}
.tcontrols {}
.tno {
    background-color: #fff;
    height: 140px;
    width: 140px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -o-border-radius: 50%;
    -ms-border-radius: 50%;
    position: relative;
    display: inline-block;
    top: 35px;
    left: 30px;
    border: 10px solid #f0f0f0;
}
.tno i {
    color: #ff695b;
    font-size: 80px;
    padding: 20px 28px;
}
.ti {
    background-color: #fff;
    height: 50px;
    width: 50px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -o-border-radius: 50%;
    -ms-border-radius: 50%;
    position: relative;
    display: inline-block;
    left: 25px;
    top: 30px;
    border: 10px solid #f0f0f0;
}
.ti .fa-info {
    font-size: 23px;
    padding: 5px 12px;
    color: #398beb;
}
.tyes {
    background-color: #fff;
    height: 140px;
    width: 140px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -o-border-radius: 50%;
    -ms-border-radius: 50%;
    position: relative;
    display: inline-block;
    top: 35px;
    left: 20px;
    border: 10px solid #f0f0f0;
}
.tyes i {
    color: #5de19c;
    font-size: 60px;
    padding: 35px 30px;
}
.credit {
    width: 400px;
    height: auto;
    position: relative;
    top: 60px;
    text-align: center;
    background-color: #f0f0f0;
    padding: 2px 0px;
}
.credit a {
    font-size: 7px;
    letter-spacing: 5px;
    color: #c0c0c0;
    text-decoration: none;
    text-transform: uppercase;
    font-family: 'Helvetica', sans-serif;
    font-style: italic;
}

.foto {
   display: block;
    margin-left: auto;
    margin-right: auto
}


 </style>		
		
		
		<div class="tbg">
			<div class="tbgwrap">
				<div class="tphoto">
					<div class="tname" text-align="center" style="background-color:rgb(192,192,192)">					
						<b><font color="black"> ${sessionScope.lista_match.get(0).getNome()} </font></b>
					</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img width="300px" style="text-align:right;" height="300px"src="${sessionScope.lista_match.get(0).getImagem() == null ? "<%=common.url%>imgs/homem.png" : sessionScope.lista_match.get(0).getImagem()}"/>
				</div>
				<div class="tcontrols">

					<a href="<%=common.base%>registraOpcao?opcao=dislike" onclick="dislike()">
						<div class="tno">
							<i class="fa fa-times" aria-hidden="true" style="margin-left:4px"></i>
						</div>
					</a>

					<a onclick="teste()">
						<div class="ti">
							<i class="fa fa-info" aria-hidden="true"></i>
						</div>
					</a>

					<a href="<%=common.base%>registraOpcao?opcao=like" onclick="like()">
						<div class="tyes">
							<i class="fa fa-heart" aria-hidden="true" style="margin-top:0px" ></i>
						</div>
					</a>
					
					<script>
					 
					  function teste(){
						  Swal.fire({
						    title: '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getNome()}',
						    html:
					            '<img width="250px" height="250px" src="'+ '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getImagem() == null ? "" : sessionScope.lista_match.get(0).getImagem()}"/>'
					            + '<p> ' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getDescricao()}' + ' </p>' 	            
					            + '<div align=left>'    
					            + '<p> <b> Sexo: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getSexo() == 'F' ? "Feminino" : "Maculino"}' + ' </p>' 
					            + '<p> <b> Possui Cachorro?: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getCachorro() == 'S' ? "Sim" : "Não"}' + ' </p>' 
					            + '<p> <b> Possui Gato?: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getGato() == 'S' ? "Sim" : "Não"}' + ' </p>' 
					            + '<p> <b> É fumante?: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getFumante() == 'S' ? "Sim" : "Não"}' + ' </p>' 
					            + '<p> <b> Trabalha?: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getTrabalha() == 'S' ? "Sim" : "Não"}' + ' </p>' 
					            + '<p> <b> Faz curso de: </b>' +  '${sessionScope.lista_match.isEmpty() ? "" : sessionScope.lista_match.get(0).getDescricao_curso()}' + ' </p>' 
					            + '</div>'  ,
					   	 	})
						}
					  
					  function like(){ 
						  const Toast = Swal.mixin({
							  toast: true,
							  position: 'top',
							  showConfirmButton: false,
							  timer: 600,
							  timerProgressBar: true,
							  didOpen: (toast) => {
							    toast.addEventListener('mouseenter', Swal.stopTimer)
							    toast.addEventListener('mouseleave', Swal.resumeTimer)
							  }
							})

							  Toast.fire({
							    icon: 'success',
							    title: 'Like' 
							  })
							}
					  
					  function dislike(){ 
						  const Toast = Swal.mixin({
							  toast: true,
							  position: 'top',
							  showConfirmButton: false,
							  timer: 600,
							  timerProgressBar: true,
							  didOpen: (toast) => {
							    toast.addEventListener('mouseenter', Swal.stopTimer)
							    toast.addEventListener('mouseleave', Swal.resumeTimer)
							  }
							})

							  Toast.fire({
							    icon: 'error',
							    title: 'Dislike' 
							  })
							}
					  
					 
					 </script>
					
				</div>
			</div>	
		</div>