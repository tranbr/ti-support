<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
 	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="xml" indent="yes" />
	
	<xsl:template match="XML__ReportExtract">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="report"
					page-height="8.5in" page-width="11in" margin-top="0.25in"
					margin-bottom="0.1in" margin-left="1in" margin-right="1in">
					<fo:region-body margin-top=".65in" margin-bottom=".1in" />
					<fo:region-before extent="5.2in" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<xsl:apply-templates select="reportExtractSet" />
		</fo:root>
	</xsl:template>
	
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="RPPF__PreformattedLines__Extract" />
	</xsl:template>
	
	<xsl:template match="RPPF__PreformattedLines__Extract">
  		<fo:page-sequence master-reference="report" initial-page-number="1" force-page-count="no-force">
  			<fo:static-content flow-name="xsl-region-before">
  				<fo:table width="100%">
					<fo:table-column column-width="40%" />
					<fo:table-column column-width="30%" />
					<fo:table-column column-width="30%" />
					<fo:table-body>	
						<fo:table-row>
							<fo:table-cell>
								<fo:block background-color="white">
									<xsl:variable name="imagePath" select="concat($GRAPHICS-FOLDER, $LOGO-FILENAME)"/>
									<fo:external-graphic content-height="scale-to-fit" scaling="non-uniform">
									 	<xsl:attribute name="src">
									 		<xsl:value-of select="$imagePath" />
									 	</xsl:attribute>
									 	<xsl:attribute name="height">
									 		<xsl:value-of select="$LOGO-HEIGHT" />
									 	</xsl:attribute>
									 	<xsl:attribute name="content-width">
									 		<xsl:value-of select="$LOGO-WIDTH" />
									 	</xsl:attribute>
									 </fo:external-graphic>
								 </fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">
									<xsl:text>IDOC Issue Documents Report</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="right" font-size="10pt" font-family="monospace" font-weight="bold">
									Page <fo:page-number/> of <fo:page-number-citation-last ref-id="{generate-id(.)}"/>
								</fo:block>	
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
  			</fo:static-content>
  		
			<fo:flow flow-name="xsl-region-body">
			
				<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
				<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
				<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
				<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
				<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
				
				<xsl:for-each select="RPPF__PreformattedLines__EntrySet/string">
					<xsl:variable name="input" select="."/>
					<xsl:choose>
						<xsl:when test="$input = '!'">
							<fo:block page-break-before="always"></fo:block>
							<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
							<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
							<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
							<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
							<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">&#x00A0;</fo:block>
						</xsl:when>
						<xsl:when test="$input != ''">
							<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold" white-space='pre'>
								<xsl:value-of select="$input"/>
							</fo:block>
						</xsl:when>
						<xsl:otherwise>
							<fo:block text-align="left" font-size="10pt" font-family="monospace" font-weight="bold">
								&#x00A0;
							</fo:block>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<fo:block id="{generate-id(.)}"/>
			</fo:flow>
  		</fo:page-sequence>
	</xsl:template>
</xsl:stylesheet>