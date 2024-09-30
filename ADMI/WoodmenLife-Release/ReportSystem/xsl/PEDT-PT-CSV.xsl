<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support PT Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFPT__MasterArea"> 
		   <xsl:call-template name="plpt"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plpt">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>		
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Rounding Use,</xsl:text>
		<xsl:text>Rounding Digits,</xsl:text>
		<xsl:text>Rounding Method,</xsl:text>
		<xsl:text>Premium Table Code,</xsl:text>
		<xsl:text>Premium Use Code,</xsl:text>
		<xsl:text>Premium Amount/Percent</xsl:text>
		<xsl:text>&#10;</xsl:text> 		
		<xsl:apply-templates select="__PFPT__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFPT__Entry">	
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__ISSUE__STATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="date1Month" select="substring(__DATEX__1, 6, 2)"/>
		<xsl:variable name="date1Day" select="substring(__DATEX__1, 9)"/>
		<xsl:variable name="date1Year" select="substring(__DATEX__1, 1, 4)"/>
		<xsl:variable name="date1Date" select="concat($date1Month, '-', $date1Day, '-', $date1Year)" />
		<xsl:value-of select="$date1Date" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="date2Month" select="substring(__DATEX__2, 6, 2)"/>
		<xsl:variable name="date2Day" select="substring(__DATEX__2, 9)"/>
		<xsl:variable name="date2Year" select="substring(__DATEX__2, 1, 4)"/>
		<xsl:variable name="date2Date" select="concat($date2Month, '-', $date2Day, '-', $date2Year)" />
		<xsl:value-of select="$date2Date" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ROUND__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ROUND__DIGITS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ROUND__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:for-each select="__PFPT__SubEntrySet/PFPT__SubEntry" >
			<xsl:choose>
				<xsl:when test="count(preceding-sibling::PFPT__SubEntry) = 0">
					<xsl:text>,"</xsl:text>
					<xsl:value-of select="__TABLE__CODE" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="__USE__CODE" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="__AMOUNT__OR__PERCENT" />
					<xsl:text>"</xsl:text>
					<xsl:text>&#10;</xsl:text> 
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="normalize-space(__TABLE__CODE)">
						<xsl:text>"","","","","","","</xsl:text>
						<xsl:value-of select="__TABLE__CODE" />
						<xsl:text>"</xsl:text>
						<xsl:text>,</xsl:text>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="__USE__CODE" />
						<xsl:text>"</xsl:text>
						<xsl:text>,</xsl:text>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="__AMOUNT__OR__PERCENT" />
						<xsl:text>"</xsl:text>
						<xsl:text>&#10;</xsl:text> 
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>