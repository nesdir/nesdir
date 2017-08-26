<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl" exclude-result-prefixes="exsl">
	<xsl:template name="counter">
		<xsl:param name="i" />
		<xsl:param name="count" />

		<xsl:if test="$i &lt;= $count">
			<exsl:document method="html" href="output/mapper{$i}.html">
				<html>
				<head>
				<title>NES Directory - Mapper <xsl:value-of select="$i"/></title>
				<link rel="icon" type="image/png" href="nesdir-small.png" />
				<link rel="stylesheet" href="nesdir.css" />
				</head>
				<body>
					<h1>NES Directory - Mapper <xsl:value-of select="$i"/></h1>

					<table>
						<tr>
							<th>CRC32</th>
							<th>Title</th>
							<th>Region</th>
							<th>Catalog ID</th>
							<th>Publisher</th>
							<th>Board</th>
						</tr>
						<xsl:for-each select="game">
							<xsl:if test="$i = cartridge/board/@mapper">
								<tr>
									<td><xsl:value-of select="cartridge/@crc"/></td>
									<td><a href="{cartridge/@crc}_{@region}.html"><xsl:value-of select="@name"/></a></td>
									<td><xsl:value-of select="@region"/></td>
									<td><xsl:value-of select="@catalog"/></td>
									<td><xsl:value-of select="@publisher"/></td>
									<td><xsl:value-of select="cartridge/board/@type"/></td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
				</body>
				</html>
			</exsl:document>
		</xsl:if>

		<xsl:if test="$i &lt;= $count">
			<xsl:call-template name="counter">
				<xsl:with-param name="i">
					<xsl:value-of select="$i + 1"/>
				</xsl:with-param>
				<xsl:with-param name="count">
					<xsl:value-of select="$count"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/database">
		<xsl:call-template name="counter">
			<xsl:with-param name="i">0</xsl:with-param>
			<xsl:with-param name="count">255</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>