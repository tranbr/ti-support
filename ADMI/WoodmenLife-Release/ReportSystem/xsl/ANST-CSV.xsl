<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	
	<!-- Support QNST CSV XSL Transformation Process -->
	
	<xsl:template match="XML__ReportExtract">
		<xsl:apply-templates select="reportExtractSet" />
	</xsl:template>
	
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="RPPF__PreformattedLines__Extract" />
	</xsl:template>
	
	<xsl:template match="RPPF__PreformattedLines__Extract">
		<xsl:text>****** Annual Statement Report ******</xsl:text>
  		<xsl:for-each select="RPPF__PreformattedLines__EntrySet/string">
  			<xsl:variable name="input" select="."/>
  		    <xsl:choose>
				<xsl:when test="$input = '!'">
					<xsl:text>&#10;</xsl:text>
					<xsl:text>&#10;</xsl:text>
					<xsl:text>&#10;</xsl:text>
					<xsl:text>&#10;</xsl:text>
					<xsl:text>&#10;</xsl:text>
				</xsl:when>
				<xsl:when test="$input != ''">
					<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold" white-space='pre'>
						<xsl:text>"</xsl:text><xsl:value-of select="$input" /><xsl:text>"</xsl:text>
						<xsl:text>&#10;</xsl:text>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>&#10;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>****** End of Annual Statement Report ******</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>