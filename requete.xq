xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";
<html>
<head>
	<title>XQuery</title>
	<link type="text/css" rel="stylesheet" href="css/style.css"/>
</head>
<body>
<center><h1>XQUERY : Liste des auteurs</h1></center>
	{
	
		(:Parcourir la liste des auteurs:)
		for $aut in doc("recettes.xml")//auteur order by $aut/nom/text() and $aut/prenom/text()
		return <auteur>
			<h2>Auteur : {$aut/nom/text()} {$aut/prenom/text()}</h2>
			<ul>
			 {
				 (:Parcourir la liste des reference des recettes dans les elements auteurs et les éléments des recettes dans le fichier:)
				 for $ref_rec_aut in $aut/refrecette,$rec in doc("recettes.xml")//recette
				 (:comparer si reference du recette dans l'element auteur est égal au ID du recette:)
				 where $ref_rec_aut/@ref = $rec/@id 
				 return <li>
				 <recette><h3>Recette : {$rec/@titre/string()}</h3>
				{
					(:Parcourir les elements sous categorie dans le fichier recettes.xml liste des auteurs:)
					for $sous_categ in doc("recettes.xml")//souscategorie,$ref_rec_sous_categ in $sous_categ/refrecette 
					(:comparer si reference du recette dans l'element sous categorie est egal au ID du recette trouver dans l'auteur:)
					where $ref_rec_sous_categ/@ref = $rec/@id 
					return <h4><souscategorie>Sous Categorie : {$sous_categ/nom/text() }</souscategorie> </h4>
				}	
				</recette>
				 </li>
			 }
			</ul>
		 </auteur>
	}
</body>
</html>