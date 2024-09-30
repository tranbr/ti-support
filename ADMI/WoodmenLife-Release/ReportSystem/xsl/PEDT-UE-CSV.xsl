<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support UE Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFUE__MasterArea"> 
		   <xsl:call-template name="plue"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plue">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>		
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Date Use Code,</xsl:text>
		<xsl:text>Process Use Code,</xsl:text>
		<xsl:text>Type Use Code,</xsl:text>
		<xsl:text>Plan Code/Logic/Module</xsl:text>
		<xsl:text>&#10;</xsl:text> 		
		<xsl:apply-templates select="__PFUE__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFUE__Entry">	
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
		<xsl:value-of select="__DATE__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:for-each select="__PFUE__SubEntrySet/PFUE__SubEntry" >
			<xsl:choose>
				<xsl:when test="count(preceding-sibling::PFUE__SubEntry) = 0">
					<xsl:text>,"</xsl:text>
					<xsl:value-of select="__PROCESS__USE__CODE" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="__TYPE__USE__CODE" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="__PLAN__BEN__EX" />
					<xsl:text>"</xsl:text>
					<xsl:text>&#10;</xsl:text> 
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="normalize-space(__PROCESS__USE__CODE)">
						<xsl:text>"","","","","</xsl:text>
						<xsl:value-of select="__PROCESS__USE__CODE" />
						<xsl:text>"</xsl:text>
						<xsl:text>,</xsl:text>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="__TYPE__USE__CODE" />
						<xsl:text>"</xsl:text>
						<xsl:text>,</xsl:text>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="__PLAN__BEN__EX" />
						<xsl:text>"</xsl:text>
						<xsl:text>&#10;</xsl:text> 
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>