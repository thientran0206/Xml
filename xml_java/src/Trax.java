
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class Trax {

	public static void main(String[]args) throws Exception{
		 
		Document doc;
		DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		DocumentBuilder db=dbf.newDocumentBuilder(); 
		doc=db.parse("recettes.xml");
		Element root =doc.getDocumentElement();
		Document document = parcours(root);
	
			
		//serialisation
		
		TransformerFactory myFactory = TransformerFactory.newInstance();
		Transformer transformer = myFactory.newTransformer();
		transformer.setOutputProperty(OutputKeys.ENCODING, "iso-8859-1");
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.transform(new DOMSource(document), new StreamResult("arbre.xml"));
		System.out.println("Le fichier arbre.xml est creer ");
		   
	}
	
 static Document parcours(Element e) throws Exception{
	
 	Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
	   
	Element  racine = doc.createElement("recette");
	 
	NodeList liste = e.getElementsByTagName("recette");
		
		for (int j=0; j<liste.getLength(); j++)
		{
			Element er = (Element)liste.item(j);
			
			Element titre = doc.createElement("titre_r");
			titre.appendChild(doc.createTextNode(er.getAttribute("titre")));
			racine.appendChild(titre);
		}
		doc.appendChild(racine);
		return doc;	
			
 }
}