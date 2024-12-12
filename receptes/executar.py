#!/usr/bin/env python3

from lxml import etree

# Defineix els noms dels fitxers XML i XSLT
xml_file = 'recetas.xml'
xslt_file = 'recetas.xsl'

try:
    # Càrrega i analitza els fitxers XML i XSLT
    xml = etree.parse(xml_file)
    xslt = etree.parse(xslt_file)
    transform = etree.XSLT(xslt)

    # Busca les receptes en el XML
    recipes = xml.xpath('//receta')
    print(f"Se encontraron {len(recipes)} recetas en el XML.")

    # Aplica la transformació per a cada recepta
    for idx, recipe in enumerate(recipes, start=1):
        try:
            # Extrau el títol per generar un nom únic
            title = recipe.find("titulo").text
            sanitized_title = "".join(c if c.isalnum() else "_" for c in title)

            print(f"Procesando receta {idx}: {title}")

            # Genera un document XML únic per a cada recepta
            single_recipe_xml = etree.Element("recetas")
            single_recipe_xml.append(recipe)

            # Realitza la transformació del document
            output = transform(etree.ElementTree(single_recipe_xml))

            # Genera el nom del fitxer de sortida
            filename = f"receptes_{idx}_{sanitized_title}.html"

            # Escriu la sortida al fitxer corresponent
            with open(filename, 'wb') as f:
                f.write(etree.tostring(output, pretty_print=True, encoding="UTF-8"))

            print(f"Generado: {filename}")
        except Exception as e:
            print(f"Error procesando receta {idx}: {e}")
except FileNotFoundError as e:
    print(f"Error: No se encontró el archivo {e.filename}. Asegúrate de que el archivo esté en el directorio correcto.")
except etree.XMLSyntaxError as e:
    print(f"Error: Problema en el archivo XML o XSLT - {e}")
except Exception as e:
    print(f"Error inesperado: {e}")

