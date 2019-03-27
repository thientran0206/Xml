<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" exclude-result-prefixes="array fn map math xhtml xs err" version="3.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform file:///T:/xml/schema.xsd">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/" name="xsl:initial-template">
		<recettes>
			<xsl:for-each select="//objet[@type = 'recette']">
				<recette>
					<xsl:attribute name="id">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
					<xsl:attribute name="titre">
						<xsl:value-of select="info[@nom='nom']/@value"/>
					</xsl:attribute>
					<xsl:attribute name="datepub">
						<xsl:value-of select="info[@nom='date_publication']/@value"/>
					</xsl:attribute>
					<xsl:attribute name="difficulte">
						<xsl:value-of select="info[@nom='difficulté']/@value"/>
					</xsl:attribute>
					<xsl:attribute name="nbpersonnes">
						<xsl:value-of select="info[@nom='nbre_personnes']/@value"/>
					</xsl:attribute>
					<xsl:attribute name="tempspreparation">
						<xsl:value-of select="info[@nom='Préparation']/@value"/>
					</xsl:attribute>
					<xsl:attribute name="tempscuisson">
						<xsl:value-of select="info[@nom='Cuisson']/@value"/>
					</xsl:attribute>
					<xsl:attribute name="tempsrepos">
						<xsl:value-of select="info[@nom='Repos']/@value"/>
					</xsl:attribute>
					<xsl:attribute name="note">
						<xsl:value-of select="info[@nom='note']/@value"/>
					</xsl:attribute>
					<resume>
						<xsl:copy-of select="info[@nom='résumé']/*"/>
					</resume>
					<photo>
						<xsl:value-of select="info[@nom='photo']/@value"/>
					</photo>
					<ref_sous_categorie>
						<xsl:value-of select="info[@nom='sous-catégorie']/@value"/>
					</ref_sous_categorie>
					<ingredients>
						<!--recupererr id de chaque recette-->
						<xsl:variable name="noming" select="@id"/>
						<xsl:for-each select="info[@nom = 'ingrédient']">
							<xsl:if test="@value = //objet[@type = 'ingredient']/@id">
								<!--recupererr quantite de chaque ingredient-->
								<xsl:variable name="quant" select="@quantite"/>
								<!--recupererr id de chaque ingredient dans recette-->
								<xsl:variable name="idI" select="@value"/>
								<xsl:for-each select="//objet[@type = 'ingredient'] ">
									<!--recupererr id de chaque ingredient-->
									<xsl:variable name="quanting" select="@id"/>
									<xsl:if test="$quanting= $idI ">
										<p>
											<xsl:value-of select="info[@nom='nom']/@value"/>
											<xsl:text> : </xsl:text>
											<xsl:value-of select="$quant"/>
										</p>
										<br/>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
					</ingredients>
					<descriptionpreparation>
						<xsl:copy-of select="info[@nom='Préparation']/*"/>
					</descriptionpreparation>
					<!--Références-->
					<xsl:variable name="idrec" select="@id"/>
					<xsl:for-each select="//objet[@type = 'ingredient'] ">
						<xsl:if test="info[@nom='recette']/@value = $idrec ">
							<refingd>
								<xsl:attribute name="ref">
									<xsl:value-of select="@id"/>
								</xsl:attribute>
							</refingd>
						</xsl:if>
					</xsl:for-each>
				</recette>
			</xsl:for-each>
			<!--Element ingredient-->
			<xsl:for-each select="//objet[@type = 'ingredient']">
				<ingredient>
					<!--Attributs ingredient-->
					<xsl:attribute name="id">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
					<xsl:attribute name="nom">
						<xsl:value-of select="info[@nom='nom']/@value"/>
					</xsl:attribute>
					<xsl:attribute name="saison">
						<xsl:value-of select="info[@nom='saison']/@value"/>
					</xsl:attribute>
					<!--Elements dans ingredient-->
					<apportnutritif>
						<xsl:value-of select="info[@nom='Apport énergétique']/@value"/>
					</apportnutritif>
					<apportenergitique>
						<xsl:value-of select="info[@nom='Apport nutritif']/@value"/>
					</apportenergitique>
					<descripitif>
						<xsl:value-of select="info[@nom='descriptif']"/>
					</descripitif>
				</ingredient>
			</xsl:for-each>
			<!--Element Auteur-->
			<xsl:for-each select="//objet[@type = 'auteur']">
				<auteur>
					<!--Attributs auteur-->
					<xsl:attribute name="id">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
					<!--Elements dans l'auteur-->
					<nom>
						<xsl:value-of select="info[@nom='nom']/@value"/>
					</nom>
					<prenom>
						<xsl:value-of select="info[@nom='prenom']/@value"/>
					</prenom>
					<age>
						<xsl:value-of select="info[@nom='age']/@value"/>
					</age>
					<pays>
						<xsl:value-of select="info[@nom='pays']/@value"/>
					</pays>
					<sexe>
						<xsl:value-of select="info[@nom='sexe']/@value"/>
					</sexe>
					<biographie>
						<xsl:value-of select="info[@nom='biographie']/@value"/>
					</biographie>
					<!--Références-->
					<xsl:variable name="idaut" select="@id"/>
					<xsl:for-each select="//objet[@type = 'recette']">
						<xsl:if test="info[@nom='auteur']/@value = $idaut">
							<refrecette>
								<xsl:attribute name="ref">
									<xsl:value-of select="@id"/>
								</xsl:attribute>
							</refrecette>
						</xsl:if>
					</xsl:for-each>
				</auteur>
			</xsl:for-each>
			<!--Element Categorie-->
			<xsl:for-each select="//objet[@type = 'catégorie']">
				<categorie>
					<!--Attributs catégorie-->
					<xsl:attribute name="id">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
					<!--Elements dans catégorie-->
					<nom>
						<xsl:value-of select="info[@nom='nom']/@value"/>
					</nom>
					<description>
						<xsl:value-of select="info[@nom='descriptif']"/>
					</description>
					<!--Références-->
					<xsl:variable name="idc" select="@id"/>
					<xsl:for-each select="//objet[@type = 'sous-catégorie']">
						<xsl:if test="info[@nom='catégorie']/@value = $idc">
							<refsouscategorie>
								<xsl:attribute name="ref">
									<xsl:value-of select="@id"/>
								</xsl:attribute>
							</refsouscategorie>
						</xsl:if>
					</xsl:for-each>
				</categorie>
			</xsl:for-each>
			<xsl:for-each select="//objet[@type = 'sous-catégorie']">
				<souscategorie>
					<!--Attribut sous catégorie-->
					<xsl:attribute name="id">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
					<!--Elements dans sous categorie-->
					<nom>
						<xsl:value-of select="info[@nom='nom']/@value"/>
					</nom>
					<description>
						<xsl:value-of select="info[@nom='descriptif']"/>
					</description>
					<!--Références-->
					<xsl:variable name="idsc" select="@id"/>
					<xsl:for-each select="//objet[@type = 'recette']">
						<xsl:if test="info[@nom='sous-catégorie']/@value = $idsc">
							<refrecette>
								<xsl:attribute name="ref">
									<xsl:value-of select="@id"/>
								</xsl:attribute>
							</refrecette>
						</xsl:if>
					</xsl:for-each>
				</souscategorie>
			</xsl:for-each>
		</recettes>
	</xsl:template>
</xsl:stylesheet>
