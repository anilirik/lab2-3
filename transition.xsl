<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="vRu" select="'ru'"/>
<xsl:variable name="vEn" select="'en'"/>
 
  <xsl:template match="/document">
    <html>
	<head>
		<style type="text/css">
		table
		{
			font-family: Helvetica, sans-serif; 
		}
		h2
		{
			font-size: 130%; 
			font-family: Helvetica, sans-serif; 
			color: #4682B4;
		}
		h3
		{
			font-size: 120%; 
			font-family: Helvetica, sans-serif; 
			color: #FF8C00;
		}
		h4
		{
			font-size: 110%; 
			font-family: Helvetica, sans-serif; 
			color: #778899;
			margin-bottom: 0;
		}
		li
		{
			font-size: 100%; 
			font-family: Helvetica, sans-serif; 
		}
		div
		{
			margin-top: 0;
		}
		</style>
	</head>
	<body>
		<xsl:value-of disable-output-escaping="yes" select="info"/>
		<table align="center" border="0" cellpadding="5" cellspacing="0">
			<xsl:for-each select="writers/writer">
				<tr>            
					<td width="500">
						<h2 align="center">
							<xsl:value-of select="name"/>
						</h2>
						<h3>
						Произведения:
						</h3>
						<ul>
							<xsl:for-each select="worksList/work">
								<li>
									<h4>
										<xsl:value-of select="title"/> (<xsl:value-of select="@year"/>)
									</h4>
									<div>
										<xsl:choose> 
											<xsl:when test="@lang = $vRu">
												<img src="http://ubuntism.ru/wp-content/uploads/2010/06/ru.png" width="14" height="14" />
												<font color="red">RU</font>
											</xsl:when> 
											<xsl:otherwise> 
												<img src="http://ubuntism.ru/wp-content/uploads/2010/06/us.png" width="14" height="14" />
												<font color="blue">EN</font>
											</xsl:otherwise> 
										</xsl:choose>
									</div>
									Жанр:
									<ul>
										<xsl:for-each select="genres/genre">
											<li>
												<xsl:value-of select="."/>
											</li>
										</xsl:for-each>
									</ul>
								</li>
							</xsl:for-each>
						</ul>
						<br />
						<br />
					</td>
					<td align="center" valign="middle" width="450">
						<IMG width="300" height="390">
							<xsl:attribute name="src">
								<xsl:value-of select="photo/@url" />
							</xsl:attribute>
						</IMG>
					</td>
				</tr>
			</xsl:for-each>
		</table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
