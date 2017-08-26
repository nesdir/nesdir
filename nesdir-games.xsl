<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl" exclude-result-prefixes="exsl">
	<xsl:template match="/database">
		<xsl:for-each select="game">
			<exsl:document method="html" href="output/{cartridge/@crc}_{@region}.html">
				<html>
				<head>
				<title>NES Directory - <xsl:value-of select="@name"/></title>
				<link rel="icon" type="image/png" href="nesdir-small.png" />
				<link rel="stylesheet" href="nesdir.css" />
				</head>
				<body>
					<h1><xsl:value-of select="@name"/></h1>
					<h3><xsl:value-of select="@altname"/></h3>
					<div class="gameinfo">
						<ul>
							<li><xsl:text>Region: </xsl:text><xsl:value-of select="@region"/></li>
							<li><xsl:text>Class: </xsl:text><xsl:value-of select="@class"/></li>
							<li><xsl:text>Catalog: </xsl:text><xsl:value-of select="@catalog"/></li>
							<li><xsl:text>Publisher: </xsl:text><xsl:value-of select="@publisher"/></li>
							<li><xsl:text>Developer: </xsl:text><xsl:value-of select="@developer"/></li>
							<li><xsl:text>Players: </xsl:text><xsl:value-of select="@players"/></li>
							<li><xsl:text>Release Date: </xsl:text><xsl:value-of select="@date"/></li>

							<xsl:for-each select="peripherals">
								<li><xsl:text>Peripherals: </xsl:text><xsl:value-of select="device/@name"/></li>
							</xsl:for-each>
						</ul>
					</div>
					<div class="container">
						<xsl:for-each select="cartridge">
							<div class="boardinfo">
								<ul>
									<xsl:if test="@revision"><li><xsl:text>Revision: </xsl:text><xsl:value-of select="@revision"/></li></xsl:if>

									<li><xsl:text>Type: </xsl:text><xsl:value-of select="board/@type"/></li>
									<li><xsl:text>PCB: </xsl:text><xsl:value-of select="board/@pcb"/></li>
									<li><xsl:text>Mapper: </xsl:text><a href="mapper{board/@mapper}.html"><xsl:value-of select="board/@mapper"/></a></li>
									<xsl:for-each select="board/chip">
										<li><xsl:text>Chip Type: </xsl:text><xsl:value-of select="@type"/></li>
									</xsl:for-each>
									<xsl:if test="board/wram">
										<li><xsl:text>WRAM Size: </xsl:text><xsl:value-of select="board/wram/@size"/></li>
									</xsl:if>
									<xsl:if test="board/vram">
										<li><xsl:text>VRAM Size: </xsl:text><xsl:value-of select="board/vram/@size"/></li>
									</xsl:if>
									<xsl:if test="board/cic"><li><xsl:text>CIC Type: </xsl:text><xsl:value-of select="board/cic/@type"/></li></xsl:if>
									<xsl:if test = "board/pad/@h &gt; 0"><li><xsl:text>Mirroring: Horizontal</xsl:text></li></xsl:if>
									<xsl:if test = "board/pad/@v &gt; 0"><li><xsl:text>Mirroring: Vertical</xsl:text></li></xsl:if>
									<xsl:if test = "not(board/pad)"><li><xsl:text>Mirroring: Dynamic</xsl:text></li></xsl:if>
								</ul>
								<br />

								<table>
									<tr>
										<th>Type</th>
										<th>Name</th>
										<th>Size</th>
										<th>CRC32</th>
										<th>SHA1</th>
									</tr>
								<xsl:if test="board/chr">
									<tr>
										<td>PRG+CHR</td>
										<td></td>
										<td></td>
										<td><xsl:value-of select="@crc"/></td>
										<td><xsl:value-of select="@sha1"/></td>
									</tr>
								</xsl:if>
									<tr>
										<td>PRG</td>
										<td><xsl:value-of select="board/prg/@name"/></td>
										<td><xsl:value-of select="board/prg/@size"/></td>
										<td><xsl:value-of select="board/prg/@crc"/></td>
										<td><xsl:value-of select="board/prg/@sha1"/></td>
									</tr>
								<xsl:if test="board/chr">
									<tr>
										<td>CHR</td>
										<td><xsl:value-of select="board/chr/@name"/></td>
										<td><xsl:value-of select="board/chr/@size"/></td>
										<td><xsl:value-of select="board/chr/@crc"/></td>
										<td><xsl:value-of select="board/chr/@sha1"/></td>
									</tr>
								</xsl:if>
								</table>
							</div>
						</xsl:for-each>
					</div>
				</body>
				</html>
			</exsl:document>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>