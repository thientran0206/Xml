<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:xhtml="http://www.w3.org/1999/xhtml">
	<xsl:output name="toc-format" method="xhtml" indent="yes"></xsl:output>
								<!--doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
								doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>-->
								
								
		<!--************** création d'une template qui contient la liste des recettes qui contiennent 5 ingrédients********************-->
					<xsl:template name="liste-des-recettes-a-5-ing">
						<xsl:param name="target"/>
						<xsl:param name="href"/>
						<xsl:for-each select="recettes/recette[count(refingd)=5]">  
							<!-- parcourir la liste des recettes qui ont 5 ingrédients-->
							
							<div class="nom_recette">
									<br/>
									<br/>
									<br/>
								<h2><a href="{@id}.html"><xsl:value-of select ="@titre"/></a></h2>
							</div>
							<xsl:variable name="sr" select="photo"/>
							<img class="image_recette" alt="image" src="{$sr}"/>
							<br/>
							<br/>
							<xsl:value-of select="resume"/>
							<br/>
							<br/>
							
						</xsl:for-each>	
				
				</xsl:template>
				
		<!--**************** création d'une template qui contient la liste des auteurs qui ont des recettes faciles ***************-->		
			<xsl:template name="liste-des-auteurs-recettes-faciles">
			
				<h2><em>Liste des auteurs qui ont des recettes faciles</em> </h2>
				<br/>
				<br/>
				<br/>
				<xsl:for-each select="//recette[@difficulte='Facile']">
					<xsl:variable name="var" select="@id"/>
					<xsl:for-each select="//auteur">
						<xsl:if test="refrecette/@ref=$var">
							<h3><a href="{@id}.html"><xsl:value-of select="nom"/> 
								<xsl:text> </xsl:text>
								<xsl:value-of select="prenom"/></a>
							</h3>
							<br/>
							<p>Biographie:<xsl:value-of select="biographie"/></p>
							<br/>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:template>
			
			<!--**************** création d'une template qui contient menu ***************-->		

<xsl:template name="menu-header">
		<header>
			<div id="stuck_container" class="stuck_container">
				<div class="container">
					<div class="brand">
						<h1 class="brand_name">
							<a href="index.html">Recettes</a>
						</h1>
					</div>
					<nav class="nav">
						<ul class="sf-menu">
							<li>
								<a href="index.html">Accueil</a>
							</li>
							<li>
								<a href="recettes.html">Recettes</a>
							</li>
						<li>
							<a href="auteurs.html">Auteurs</a>
						</li>
						<li>
							<a href="categories.html">Categories</a>
						</li>
						<li>
							<a href="ingredients.html">Ingredients</a>
						</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</xsl:template>			
			
	<xsl:template match="/">
		<!--***********************Creation de la page index.html*******************************************-->
		<!--*****************************************************************************************************-->
			<xsl:result-document href="xsl_xhtml/index.html" format="toc-format">
				<html  xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<meta http-equiv="Content-Type" content="text/xml; charset=iso-8859-1"/>
		<title>Recettes Accueil </title>
		<link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
		<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
		<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
		<script type="text/javascript" src="js/device.min.js"></script>
					</head>
								
								<body>
						<!--==============================header=================================-->
									 
										<xsl:call-template name="menu-header"/>
									
	
											<h2><em>Liste des reccettes a 5 ingrédients</em></h2>
											<br/>
											<div class="container">
												<xsl:call-template name="liste-des-recettes-a-5-ing"/>
											</div>
											<br/>		
											<div class="container">
												<xsl:call-template name="liste-des-auteurs-recettes-faciles"/>
											</div>		
					</body>	
				</html>
			</xsl:result-document>	
			
			
				<!-- *********************creation de la page recettes.html******************************-->
				
					<xsl:result-document href="xsl_xhtml/recettes.html" format="toc-format">
					<html  xmlns="http://www.w3.org/1999/xhtml">
						<head>
							<title>Recette</title>
							 <link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
							<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
							<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
							<script type="text/javascript" src="js/jquery.js"/>
							<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
							<script type="text/javascript" src='js/device.min.js'/>
						</head>
						<body>
						<!--==============================header=================================-->
								<xsl:call-template name="menu-header"/>
								<div class="liste_recettes">
									<h2><em>Liste des recettes</em></h2>
									<br/>
									<ul id="liste">
										<xsl:for-each select="recettes/recette">
										<xsl:variable name="id" select="@id"/>
											<xsl:variable name="sr" select="photo"/>
											<li>
												<a href="{@id}.html">
													<xsl:value-of select="@titre"/>
												</a>
												<!--Pour avoir / a la fin du balise img-->
												<xsl:text disable-output-escaping="yes"><![CDATA[<img alt="IMG" src = "]]></xsl:text>
												<xsl:value-of select="$sr"/>
												<xsl:text disable-output-escaping="yes"><![CDATA[" />]]></xsl:text>
												<xsl:text disable-output-escaping="yes"></xsl:text>
												<br/>
												<p align="center"> Auteurs : 
													<!--Auteurs-->
							
													<xsl:variable name="refrec" select="@id"/>
													<xsl:for-each select="//auteur">
														<xsl:variable name="refrecaut" select="refrecette/@ref"/>
														<xsl:if test="$refrec = $refrecaut">
															<a href="{@id}.html">
																<xsl:value-of select="nom"/>
																<xsl:text> </xsl:text>
																<xsl:value-of select="prenom"/>
															</a>
														</xsl:if>
													</xsl:for-each>
												</p>
												<br/>
												<br/>
											</li>
										</xsl:for-each>
		</ul>
								</div>
						</body>
					</html>	
					</xsl:result-document>
				
				
				<!--*****************************Détail chaque recette********************************-->
				
				
			<xsl:for-each select="recettes/recette">  
				<!-- parcourir la liste des recettes-->
				<xsl:variable name="id" select="@id"/>  
				<!-- creation d'un fichier HTML qui décrit chaque recette-->
				<xsl:result-document  format="toc-format" href="xsl_xhtml/{@id}.html">
				<html  xmlns="http://www.w3.org/1999/xhtml">
					
				<head>
					<title>La recette</title>
					 <link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
					<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
					<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
					<script type="text/javascript" src="js/jquery.js"/>
					<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
					<script type="text/javascript" src='js/device.min.js'/>
				 </head>
								<body>
						<!--==============================header=================================-->
									<xsl:call-template name="menu-header"/>
													<div class="nom_recette">
														<h2><em><xsl:value-of select ="@titre"/></em></h2>
													</div>
													<br/>
													<br/>
													<xsl:variable name="sr" select="photo"/>
													<img class="image_recette" alt="image" width="300px" height="300px" src="{$sr}"/>
													<br/>
													<br/>
													<xsl:value-of select="resume"/>
													<br/>
													<br/>
													Auteurs : 
													<!--Auteurs-->
													<xsl:variable name="refrec" select="@id"/>
													<xsl:for-each select="//auteur">
														<xsl:variable name="refrecaut" select="refrecette/@ref"/>
														<xsl:if test="$refrec = $refrecaut">
															<a href="{@id}.html">
															<xsl:value-of select="nom"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="prenom"/>
															</a>
														</xsl:if>
													</xsl:for-each>
													<p>Préparation : <xsl:value-of select="@tempspreparation"/></p>
													<p>Cuisson : <xsl:value-of select="@tempscuisson"/></p>
													<p>Repos : <xsl:value-of select="@tempsrepos"/></p>
													<p>Dificulté : <xsl:value-of select="@difficulte"/></p>
													<p>Note : <xsl:value-of select="@note"/></p>

													<p align="center"> Nombre de personne :  <xsl:value-of select="@nbpersonnes"/></p>
													<p align="center"> Date publication : <xsl:value-of select="@datepub"/> </p>
												
													
													<div class="description">
														<ins><h2>Préparation </h2></ins>
			
														<xsl:copy-of select="descriptionpreparation"/>	
													</div>
													<br/>
													<br/>
													
													<ins><h2>Listes des Ingrédients</h2></ins>
													<!--Ingrédients-->
														<xsl:copy-of select="ingredients"/>
													<!--Sous Categorie-->	
													<br/>
													<br/>
													<ins><h2>Listes des Sous Categories</h2></ins>
														<xsl:variable name="refrec" select="@id"/>
														<xsl:for-each select="//souscategorie">
															<xsl:variable name="refrecsc" select="refrecette/@ref"/>
															<xsl:if test="$refrec = $refrecsc">
																<a href="{@id}.html"><xsl:value-of select="nom"/></a>
															</xsl:if>
														</xsl:for-each>

										   
					</body>	
				</html>
			</xsl:result-document>
			</xsl:for-each>	
			
				<!--************************Creation de la page auteur et les détailles de chaque auteur*************************-->	
					
				
					<xsl:result-document href="xsl_xhtml/auteurs.html" format="toc-format">
					<html  xmlns="http://www.w3.org/1999/xhtml">
						<head>
							<title>Recette</title>
							 <link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
							<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
							<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
							<script type="text/javascript" src="js/jquery.js"/>
							<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
							<script type="text/javascript" src='js/device.min.js'/>
						</head>
						<body>
						<!--==============================header=================================-->
									<xsl:call-template name="menu-header"/>
								<div class="liste_auteur">
									<h2><em>Liste des auteurs</em></h2>
									<ul>
									  <xsl:for-each select="recettes/auteur">
										<li><a href="{@id}.html"><xsl:value-of select="nom"/> <xsl:text>  </xsl:text> <xsl:value-of select="prenom"/></a></li>
										</xsl:for-each>		
									</ul>	
								</div>
						</body>
					</html>	
					</xsl:result-document>
					
					
					<!--******************************Détail les auteurs****************-->
						
				<xsl:for-each select="recettes/auteur">  
				<!-- parcourir la liste des recettes-->
				<xsl:variable name="id" select="@id"/>  
				<!-- creation d'un fichier HTML qui décrit chaque recette-->
				<xsl:result-document  format="toc-format" href="xsl_xhtml/{@id}.html">
				<html  xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<title>Recette</title>
						 <link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
						<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
						<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
						<script type="text/javascript" src="js/jquery.js"/>
						<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
						<script type="text/javascript" src='js/device.min.js'/>
					</head>
								<head>
									<title>La recette</title>
								 </head>
								<body>
						<!--==============================header=================================-->
									<xsl:call-template name="menu-header"/>

									
									<!--content-->
									<div class="content">
										<h2><em><xsl:value-of select ="nom"/><xsl:value-of select ="prenom"/></em></h2>
										<br/>
										<br/>
										<div style="margin-left:34px;">
											<br/>
											Age : <xsl:value-of select="age"/>
											<br/>
											Sexe : <xsl:value-of select="sexe"/>
											<br/>
											Pays : <xsl:value-of select="pays"/>
											<br/>
											Biographie : <xsl:value-of select="biographie"/>
											<br/>
											<br/>
											<br/>
										</div>
										<ins><h2><em>Listes des Recettes </em></h2></ins>
										<br/>
										<br/>
										<!--Recettes-->
											<xsl:for-each select="refrecette">
												<xsl:variable name="refrec" select="@ref"/>
												<xsl:for-each select="//recette">
													<xsl:variable name="refrecette" select="@id"/>
													<xsl:if test="$refrec = $refrecette">
														<a href="{@id}.html"><xsl:value-of select="@titre"/></a>
														<br/>
													</xsl:if>
												</xsl:for-each>
											</xsl:for-each>
									</div>
						</body>
					</html>
				</xsl:result-document>
				</xsl:for-each>
				
				
<!--**************************Creation de la page ingredient et les détailles de chaque ingredient************************************-->				
					<xsl:result-document href="xsl_xhtml/ingredients.html" format="toc-format">
					<html  xmlns="http://www.w3.org/1999/xhtml">
						<head>
							<title>Recette</title>
							<link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
							<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
							<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
							<script type="text/javascript" src="js/jquery.js"/>
							<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
							<script type="text/javascript" src='js/device.min.js'/>
						</head>
						<body>
						<!--==============================header=================================-->
								<xsl:call-template name="menu-header"/>

								<div class="liste_ingredients">
									<h2><em>Liste des ingrédients</em></h2>
									<br/>
									<br/>
									<br/>
									<ul id="liste">
				   <xsl:for-each select="recettes/ingredient">
						   <li>
							   <a href="{@id}.html"><xsl:value-of select="@nom"/></a>		
						   </li>

					</xsl:for-each>		
		</ul>	
								</div>
						</body>
					</html>	
					</xsl:result-document>
				
					<!--******************************Détail les ingredients****************-->
						
				<xsl:for-each select="recettes/ingredient">  
				<!-- parcourir la liste des recettes-->
				<xsl:variable name="id" select="@id"/>  
				<!-- creation d'un fichier HTML qui décrit chaque recette-->
				<xsl:result-document  format="toc-format" href="xsl_xhtml/{@id}.html">
				<html  xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<title>Recette</title>
						 <link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
						<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
						<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
						<script type="text/javascript" src="js/jquery.js"/>
						<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
						<script type="text/javascript" src='js/device.min.js'/>
					</head>
					<body>
						<!--==============================header=================================-->
									<xsl:call-template name="menu-header"/>

									<!--content-->
									<div class="content">
										<h2><em><xsl:value-of select ="@nom"/></em></h2>
										<div style="margin-left:34px;">
											<br/>
											<br/>
											<br/>
											Apport Nutrif : <xsl:value-of select="apportnutritif"/>
											<br/>	
											Apport Energitique : <xsl:value-of select="apportenergitique"/>
											<br/>
											Descripitif : <xsl:value-of select="descripitif"/>
											<br/>
											<br/>
										</div>
										<ins><h2>Listes des Recettes</h2></ins>
										<!--Recettes-->
											<br/>
											<xsl:for-each select="refrecette">
												<xsl:variable name="refrec" select="@ref"/>
												<xsl:for-each select="//recette">
													<xsl:variable name="refrecette" select="@id"/>
													<xsl:if test="$refrec = $refrecette">
														<a href="{@id}.html"><xsl:value-of select="@titre"/></a>
														<br/>
													</xsl:if>
													<br/>
													<br/>
												</xsl:for-each>
											</xsl:for-each>
											<br/>
											<br/>
									</div>
									<!--Recettes-->
									<xsl:variable name="refingd" select="@id"/>
									<xsl:for-each select="//recette">
										<xsl:variable name="refingre" select="refingd/@ref"/>
										<xsl:if test="$refingd = $refingre">
											<a href="{@id}.html"><xsl:value-of select="@titre"/></a>	
										</xsl:if>
									</xsl:for-each>
					</body>
					</html>
					</xsl:result-document>
					</xsl:for-each>
					
					
		<!--**************************Creation de la page categorie et les détailles de chaque categorie************************************-->				
					<xsl:result-document href="xsl_xhtml/categories.html" format="toc-format">
					<html  xmlns="http://www.w3.org/1999/xhtml">
						<head>
							<title>Recette</title>
							 <link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
							<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
							<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
							<script type="text/javascript" src="js/jquery.js"/>
							<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
							<script type="text/javascript" src='js/device.min.js'/>
						</head>
						<body>
						<!--==============================header=================================-->
								<xsl:call-template name="menu-header"/>

								<div class="liste_categorie">
									<h2><em>Liste des catégories</em></h2>
									<br/>
									<br/>
									
							   <ul id="liste">
				   <xsl:for-each select="recettes/categorie">
						   <li>
							   <a href="{@id}.html"><xsl:value-of select="nom"/></a>		
						   </li>
					</xsl:for-each>		
		</ul>	
								</div>
						</body>
					</html>	
					</xsl:result-document>


<!-- **************************************Detail les catégories*****************************************************-->
				<xsl:for-each select="recettes/categorie">  
				
				<xsl:variable name="id" select="@id"/>  
				<!-- creation d'un fichier HTML qui décrit chaque recette-->
				<xsl:result-document  format="toc-format" href="xsl_xhtml/{@id}.html">
				<html  xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<title>Recette</title>
						 <link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
						<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
						<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
						<script type="text/javascript" src="js/jquery.js"/>
						<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
						<script type="text/javascript" src='js/device.min.js'/>
					</head>
					<body>
						<!--==============================header=================================-->
									<xsl:call-template name="menu-header"/>

									<!--content-->
									<div class="content">
										<h2><em><xsl:value-of select ="@nom"/></em></h2>
										<div style="margin-left:34px;"></div>
											<br/>
											Descripition : <xsl:value-of select="description"/>
											<br/>
										<!--les sous categories-->
										<ins><h2>Les sous categories</h2></ins>
										<br/>
										<br/>
										<xsl:for-each select="refsouscategorie">
											<xsl:variable name="refsoucat" select="@ref"/>
											<xsl:for-each select="//souscategorie">
												<xsl:variable name="refsouscategorie" select="@id"/>
												<xsl:if test="$refsoucat = $refsouscategorie">
													<a href="{@id}.html"><xsl:value-of select="nom"/></a>
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
									
									</div>
					</body>
				</html>
		</xsl:result-document>
		</xsl:for-each>
<!--**************************Creation les détailles de chaque  sous categorie************************************-->				
					<xsl:for-each select="recettes/souscategorie">  
				
				<xsl:variable name="id" select="@id"/>  
				<!-- creation d'un fichier HTML qui décrit chaque recette-->
				<xsl:result-document  format="toc-format" href="xsl_xhtml/{@id}.html">
				<html  xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<title>Recette</title>
						 <link type="text/css" rel="stylesheet" href="css/style.css" media="screen"/>
						<link type="text/css" rel="stylesheet" href="css/grid.css" media="screen"/>
						<link type="text/css" rel="stylesheet" href="css/contact-form.css" media="screen"/>
						<script type="text/javascript" src="js/jquery.js"/>
						<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"/>
						<script type="text/javascript" src='js/device.min.js'/>
					</head>
					<body>
						<!--==============================header=================================-->
									<xsl:call-template name="menu-header"/>
									<!--content-->
									<div class="content">
										<h2><em><xsl:value-of select ="nom"/></em></h2>
										<div style="margin-left:34px;"></div>
											<br/>
											<br/>
											<br/>
											<br/>
											Descripition : <xsl:value-of select="description"/>
											<br/>
										<!--les sous categories-->
										<br/>
										<br/>
										<ins><h2>Liste des Recettes</h2></ins>
										<br/>
										<br/>
										<!--Recettes-->
										<xsl:for-each select="refrecette">
											<xsl:variable name="refrec" select="@ref"/>
											<xsl:for-each select="//recette">
												<xsl:variable name="refrecette" select="@id"/>
												<xsl:if test="$refrec = $refrecette">
													<a href="{@id}.html"><xsl:value-of select="@titre"/></a>
													<br/>
													</xsl:if>
												</xsl:for-each>
												</xsl:for-each>
													
									</div>
					</body>
				</html>
		</xsl:result-document>
		</xsl:for-each>
					
		</xsl:template>		
</xsl:stylesheet>