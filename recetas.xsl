<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/recetas">
        <html lang="ca">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>
                    <xsl:value-of select="receta/titulo"/>
                </title>
                <link rel="stylesheet" href="receptes.css"/>
            </head>
            <body>
                <header>
                    <div class="logo">
                        <img src="../images/Logo-Delicias.png" alt="Delicias Kitchen Logo" style="width: 150px;"/>
                    </div>
                    <nav class="menu">
                        <ul>
                            <li><a href="../index.html">Inici</a></li>
                            <li><a href="../sobre_mi.html">Sobre mi</a></li>
                            <li><a href="../listado.html">Receptes</a></li>
                            <li><a href="../formulario.html">Contacte</a></li>
                        </ul>
                    </nav>
                </header>

                <main>
                    <h1>
                        <xsl:value-of select="receta/titulo"/>
                    </h1>
                    <img src="{receta/imagen}" alt="{receta/titulo}" style="margin:20px auto; display:block;"/>

                    <h2>Ingredients</h2>
                    <ul>
                        <xsl:for-each select="receta/ingredientes/ingrediente">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>

                    <h2>Temps</h2>
                    <p>
                        Preparació: <xsl:value-of select="receta/tiempo/@preparacion"/> |
                        Cocció: <xsl:value-of select="receta/tiempo/@coccion"/>
                    </p>

                    <h2>Passos</h2>
                    <ol>
                        <xsl:for-each select="receta/pasos/paso">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ol>
                </main>

                <footer>
                    <p>FACEBOOK | TWITTER | INSTAGRAM | PINTEREST | EMAIL | RSS</p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

