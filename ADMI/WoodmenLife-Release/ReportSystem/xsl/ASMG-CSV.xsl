<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="RPPF__PreformattedLines__Extract" />
	</xsl:template>
	
	<xsl:template match="RPPF__PreformattedLines__Extract">
		<xsl:for-each select="RPPF__PreformattedLines__EntrySet/string">
			<xsl:value-of select="."/>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>