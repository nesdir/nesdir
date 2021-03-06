<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl" exclude-result-prefixes="exsl">
	<xsl:template match="/database">
		<exsl:document method="html" href="output/index.html">
			<html>
			<head>
			<title>NES Directory - Table of Contents</title>
			<link rel="icon" type="image/png" href="nesdir-small.png" />
			<link rel="stylesheet" href="nesdir.css" />
			</head>
			<body>
				<h1>NES Directory - Table of Contents</h1>

				<table>
					<tr>
						<th>CRC32</th>
						<th>Title</th>
						<th>Region</th>
						<th>Catalog ID</th>
						<th>Publisher</th>
						<th>Board</th>
						<th>Mapper</th>
					</tr>
					<xsl:for-each select="game">
						<tr>
							<td><xsl:value-of select="cartridge/@crc"/></td>
							<td><a href="{cartridge/@crc}_{@region}.html"><xsl:value-of select="@name"/></a></td>
							<td><xsl:value-of select="@region"/></td>
							<td><xsl:value-of select="@catalog"/></td>
							<td><xsl:value-of select="@publisher"/></td>
							<td><xsl:value-of select="cartridge/board/@type"/></td>
							<td><a href="mapper{cartridge/board/@mapper}.html"><xsl:value-of select="cartridge/board/@mapper"/></a></td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
			</html>
		</exsl:document>
	</xsl:template>
</xsl:stylesheet>