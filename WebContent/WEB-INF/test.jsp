<%@page import="java.util.ArrayList"%>
<%@ page 	language = "java" 
			contentType = "text/html; charset=UTF-8"
   	 		pageEncoding = "UTF-8" 
   	 		import = "com.openjpa.entities.*"
   	 		import = "com.openjpa.constant.*" 
   	 		import = "java.awt.List" %>
   	 		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	
    	<style type="text/css"><%@ include file = "css/bootstrap.css" %></style>
    	
    	<style type="text/css"><%@ include file = "css/custom.css" %></style>
    		
	    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
		
		<title>Ikya | Voir et envoyer un challenge</title>
	</head>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Start Bootstrap</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	<body>

    <!-- Page Content -->
    <div class="container">

       <%
			
			User userTest = (User)request.getAttribute("userFinded");
					
			ArrayList<Challenge> challenges = (ArrayList<Challenge>)request.getAttribute("challenges");
					
		%>
		
		<div class="row">
            <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
            	<div class="alert alert-info text-center" role="alert">
  					<a href="#" class="alert-link">Hi <% out.println(userTest.getPseudo()); %> ! Please check your challenge or send new challenges to your contacts ...</a>
				</div>
            	<div class="panel panel-default">
  					<div class="panel-heading text-center">Lancer un défit à un contact ! </div>
  					<div class="panel-body">
    				  <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
					    
					    <!-- from to create a new challenge -->
					    
					    <form action="${pageContext.request.contextPath}/TreatChallenge" method="POST">  
					    	<div class="input-group barRecherche">
						      <input name="contact" type="text" class="form-control recherche" placeholder="Search for a contact..." />
						      <span class="input-group-btn">
						        <button class="btn btn-default" type="button">Search !</button>
						      </span>
						    </div><!-- /input-group -->
						    <div class="input-group">
						      <input type="hidden" name="contactFinal" type="text" class="form-control contactFinal" placeholder="Search for a contact..." />
						    </div><!-- /input-group -->
						    <div class="input-group">
						      <input type="hidden" name="pseudoUser" type="text" class="form-control" value=<% out.println(userTest.getPseudo()); %> />
						    </div><!-- /input-group -->
					    	<br /> 
						    <div class="form-group">
							    <textarea name="challenge" class="form-control custom-textarea" placeholder = "Insérer le contenu de votre défit..." ></textarea>
							</div><!-- /input-group -->
							<button type="submit" class="btn btn-primary pull-right bouton-create-challenge">Envoyer</button>
						</form>
						
						<!-- / from to create a new challenge -->
						
  					  </div>
  				   </div>
				</div>
				<div class="panel panel-default">
  					<div class="panel-heading text-center">Liste de mes challenges !</div>
  						<div class="panel-body">
  						<div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
	  						<br />
	    					<ul class="list-group">
	    					
	    						<% 
	    						
	    							for(Challenge challenge : challenges){
										
										%>
										
											<li class="list-group-item">
												<div class="row">
													<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
														description : <% out.println(challenge.getDescription()); %>
													</div>
													<div class="col-xs-2 col-xs-offset-6 col-sm-2 col-sm-offset-6 col-md-2 col-md-offset-6 col-lg-2 col-lg-offset-6 text-center">
														<span class="badge"><% out.println(Constants.hashMapChallenge.get(challenge.getStatut())); %></span>
													</div>
												</div>
												<div class="row">
													
													<%
														System.out.println(Constants.hashMapChallenge.get(challenge.getStatut()));
														
														//--------------------
														// local variable for switch treatment
														//--------------------
														
														Integer state  				= challenge.getStatut();
														
														Integer idChallenge 		= challenge.getId();
														
														Integer idUser 				= userTest.getId();
											            		
											            Integer challengeIdUser 	= challenge.getId_user();
											            		
											            Integer challengeIdContact 	= challenge.getId_contact();
											            
											            Integer challengeIdWinner 	= challenge.getId_winner();
														
														//--------------------
														// treatment to show good buttons in current challenge
														//--------------------
														
														switch (state) {
														
											            case 10:
											            		
											            		if( challengeIdContact.equals(idUser) ){
											            		
												            		%>
												            			
													            		<div class="col-xs-4 col-xs-offset-4 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 text-center">
													            			
													            			<%
													            					
													            					String getRequestAccepte = "/TreatChallenge?function=choiceChallenge&choice=true&idUser="+idUser+"&idChallenge="+idChallenge;
													            					
													            					String getRequestRefuse = "/TreatChallenge?function=choiceChallenge&choice=false&idUser="+idUser+"&idChallenge="+idChallenge;
													            			
													            			%>
													            		
																			<a href="${pageContext.request.contextPath}<%= getRequestAccepte %>">
																				<button type="button" class="btn btn-success">Accepter</button>
																			</a>
																			<a href="${pageContext.request.contextPath}<%= getRequestRefuse %>">
																				<button type="button" class="btn btn-danger">Refuser</button>
																			</a>
																		</div>
														
												            		<%
											            		
											            		} else {
											            			
											            			System.out.println("challengeIdContact : "+challengeIdContact+" | idUser : "+idUser);
											            			
											            			%>
												            			
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">En attente de validation !</div>
																		</div>
														
												            		<%
											            		
											            		}
											            		
											                     break;
											                     
											            case 20:
											            		
											            		if( challengeIdUser.equals(idUser) ){
											            		
												            		%>
												            			<div class="col-xs-6 col-xs-offset-3 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 text-center">
													            			
													            			<%
													            					
													            					String getRequestGagne = "/TreatChallenge?function=resultatChallenge&choice=gagne&idUser="+idUser+"&idChallenge="+idChallenge;
													            					
													            					String getRequestMatchNul = "/TreatChallenge?function=resultatChallenge&choice=nul&idUser="+idUser+"&idChallenge="+idChallenge;
													            			
													            					String getRequestPerdu = "/TreatChallenge?function=resultatChallenge&choice=perdu&idUser="+idUser+"&idChallenge="+idChallenge;
													            			
													            			%>
													            		
																			<a href="${pageContext.request.contextPath}<%= getRequestGagne %>">
																				<button type="button" class="btn btn-success">J'ai Gagné</button>
																			</a>
																			<a href="${pageContext.request.contextPath}<%= getRequestMatchNul %>">
																				<button type="button" class="btn btn-info">Match Nul</button>
																			</a>
																			<a href="${pageContext.request.contextPath}<%= getRequestPerdu %>">
																				<button type="button" class="btn btn-danger">J'ai Perdu</button>
																			</a>
																		</div>
														
												            		<%
											            		
											            		} else {
											            			
											            			System.out.println("challengeIdUser : "+challengeIdUser+" | idUser : "+idUser);
											            			
											            			%>
												            			
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">Résultat à venir ...</div>
																		</div>
														
												            		<%
											            		
											            		}
											            		 
											                     break;
											                     
											            case 30:
    
											                     break;
											                     
											            case 40: 
											            		
											            		if( challengeIdWinner.equals(idUser) ){
											            			
											            			%>
												            			
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">Vous avez gagné !</div>
																		</div>
														
												            		<%
												            		
												            		}
												            		
												            		else if( challengeIdWinner.equals(-1) ){
											            			
											            			%>
												            			
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">Match nul !</div>
																		</div>
														
												            		<%
												            		
												            		}
												            		
												            		else {
											            			
											            			%>
												            			
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">Vous avez perdu ...</div>
																		</div>
														
												            		<%
												            		
												            		}
											            		
											            		if( challengeIdContact.equals(idUser) ){
											            		
												            		 %>
											            		
													            		<div class="col-xs-4 col-xs-offset-4 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 text-center">
													            			
													            			<%
													            					
													            					String getRequestAccepte = "/TreatChallenge?function=validationChallenge&choice=true&idUser="+idUser+"&idChallenge="+idChallenge;
													            					
													            					String getRequestRefuse = "/TreatChallenge?function=validationChallenge&choice=false&idUser="+idUser+"&idChallenge="+idChallenge;
													            			
													            			%>
													            		
																			<a href="${pageContext.request.contextPath}<%= getRequestAccepte %>">
																				<button type="button" class="btn btn-success">Accepter</button>
																			</a>
																			<a href="${pageContext.request.contextPath}<%= getRequestRefuse %>">
																				<button type="button" class="btn btn-danger">Refuser</button>
																			</a>
																		</div>
														
												            		<%
											            		
											            		} else {
											            		
												            		 %>
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">Validation du challenge en cours...</div>
																		</div>
														
												            		<%
											            		
											            		}
											            
											                     break;

											            default:
											            
											            			if( challengeIdWinner.equals(idUser) ){
											            			
											            			%>
												            			
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">Challenge terminé, vous avez gagné !</div>
																		</div>
														
												            		<%
												            		
												            		}
												            		
												            		else if( challengeIdWinner.equals(-1) ){
											            			
											            			%>
												            			
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">Challenge terminé, match nul !</div>
																		</div>
														
												            		<%
												            		
												            		}
												            		
												            		else {
											            			
											            			%>
												            			
												            			<br />
													            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
																			<div class="alert alert-warning" role="alert">Challenge terminé, vous avez perdu ...</div>
																		</div>
														
												            		<%
												            		
												            		}
												            		
												            		
											                     break;
											                     
											        }
														
													%>
													
												</div>
											</li>
										
										<%
					
									}
	    						
	    						%>
	    					
							</ul>
  						</div>
  					</div>
				</div>
			</div>  			
        </div>
        <!-- /.row -->
		
    </div>
    <!-- /.container -->
    
    <!-- jQuery actual google hosted library -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
    <!-- jQuery UI actual google hosted library -->
    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
    
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
  	
  	<script>
  	
	$(function() {
	  	
	  	var researchInputBoolean = false;
	  	
	  	var challengeInputBoolean = false;
	  	
	  	$( '.custom-textarea' ).blur( function () {
	  		
	  		if( $(this).val() ){
	  		
	  			challengeInputBoolean = true;
	  		
	  		}
	  		
	  		if( researchInputBoolean && challengeInputBoolean ){
	  		
	  			$('.bouton-create-challenge').prop( "disabled" , false );	
	  		
	  		}
	  	
	  	});
	  	
	  	$('.bouton-create-challenge').prop( "disabled" , true );
	  	
		var dict = [];

		$.ajax({
		
		  url 		: 'ContactResearch',
		  
		  method 	: 'GET',
		  
		  dataType 	: 'json',
		  
		  success 	: function ( data ) {
		  
		    $.each( data, function () {
		    
		    	dict.push(this.toString());
		      
		    });
		    
		    	return dict;
		    
			}
		  
		});
		
		$( '.form-control.recherche' ).autocomplete({
		
			source : dict
		  
		}).keydown(function (e) {
			
			if(e.keyCode === 13) {
			
				if($('.form-control.recherche').val()){
				
					$('.contactFinal').val( $('.form-control.recherche').val() );
					
					var result = '<span class="input-group-addon color-blue" id="sizing-addon1">'+$( '.form-control.recherche' ).val()+'</span>';
				
					$('.barRecherche').prepend(result);
					
					$( '.form-control.recherche' ).val('');
					
					$('.form-control.recherche').prop('disabled', true);
					
					researchInputBoolean = true;
					
					if( researchInputBoolean && challengeInputBoolean ){
	  		
			  			$('.bouton-create-challenge').prop( "disabled" , false );	
			  		
			  		}
				
				}
			
			}
		
		});
	    
	});
	  
	</script>
		
	</body>
</html>