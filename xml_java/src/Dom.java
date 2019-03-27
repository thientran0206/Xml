import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Dom {

	public static void main(String[]args) throws Throwable{
		
		Document doc; 
		DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		DocumentBuilder db=dbf.newDocumentBuilder(); 
		doc=db.parse("recettes.xml");
		Element root =doc.getDocumentElement();
		parcours(root);
	}
	
public static void parcours(Element e) {
	
	NodeList liste = e.getElementsByTagName("recette");
	
	System.out.println("On a "+liste.getLength()+" recettes : ");
		
		for (int j=0; j<liste.getLength(); j++)
		{
			Element er = (Element)liste.item(j);	
			System.out.print("Recette n° "+(j+1)+": ");
			System.out.println(er.getAttribute("titre"));
		}	
			
 }
}
		

	
	