<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support SPIS CSV XSL Transformation Process --> 
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
    	<xsl:apply-templates select="XML__ReportExtract/reportExtractSet" />
    	<xsl:apply-templates select="XML__ReportExtract/totals" />
  	</xsl:template>		
	<xsl:template match="XML__ReportExtract">  
	    <xsl:text>"Company Code:" </xsl:text><xsl:value-of select="./companyCode" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Company Name:" </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./companyName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report Description: " </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./reportDescription" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report ID:" </xsl:text><xsl:value-of select="./reportID" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="fromMonth" select="substring(./fromDate, 6, 2)"/>
		<xsl:variable name="fromDay" select="substring(./fromDate, 9)"/>
		<xsl:variable name="fromYear" select="substring(./fromDate, 1, 4)"/>
		<xsl:variable name="fromDate" select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" />
		<xsl:text>"From Date:" </xsl:text><xsl:value-of select="$fromDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="thruMonth" select="substring(./thruDate, 6, 2)"/>
		<xsl:variable name="thruDay" select="substring(./thruDate, 9)"/>
		<xsl:variable name="thruYear" select="substring(./thruDate, 1, 4)"/>
		<xsl:variable name="thruDate" select="concat($thruMonth, '-', $thruDay, '-', $thruYear)" />
		<xsl:text>"Thru Date:" </xsl:text><xsl:value-of select="$thruDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="reportMonth" select="substring(./reportDate, 6, 2)"/>
		<xsl:variable name="reportDay" select="substring(./reportDate, 9)"/>
		<xsl:variable name="reportYear" select="substring(./reportDate, 1, 4)"/>
		<xsl:variable name="reportDate" select="concat($reportMonth, '-', $reportDay, '-', $reportYear)" />
		<xsl:text>"Report Date:" </xsl:text><xsl:value-of select="$reportDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>"Report Time:" </xsl:text><xsl:value-of select="./reportTime" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Printed By:" </xsl:text><xsl:value-of select="./printedBy" /><xsl:text>,</xsl:text>	
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>	
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:text>"NUMBER"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"NAME"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"SITUATION"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"BALANCE FORWARD"</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="GBAL__ReportMaster" />
	</xsl:template>
	<xsl:template match="GBAL__ReportMaster">
	
		<xsl:if test= "following-sibling::GBAL__ReportMaster[position()=1]/agentNumber != agentNumber or position() = last()">
			<xsl:text>"</xsl:text><xsl:value-of select="agentNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="concat(substring-after(concat(name,''), ' '),',', substring-before(concat(name,''), ' '))" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:for-each select="concatSitBal/string">
				<xsl:text>"</xsl:text><xsl:value-of select="substring-before(concat(.,':'), ':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
				<xsl:text>"</xsl:text><xsl:value-of select="substring-after(concat(.,''),':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
				<xsl:text>&#10;</xsl:text>
				<xsl:text>,</xsl:text>
				<xsl:text>,</xsl:text>
			</xsl:for-each>
		</xsl:if>
	
		<xsl:if test= "position() = last() or following-sibling::GBAL__ReportMaster[position()=1]/agentNumber != agentNumber">
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>,</xsl:text>
	    <xsl:text>,</xsl:text>
	    <xsl:text>"CONTRACTOR TOTAL"</xsl:text>
	    <xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="format-number(contractorTotal, '$#,###,###.00')" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
        </xsl:if>
        
	</xsl:template>
  <xsl:template match="totals">
  		<xsl:text>&#10;</xsl:text>
  		<xsl:text>,</xsl:text>
  		<xsl:text>,</xsl:text>
        <xsl:text>"TOTAL"</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="total" />
	</xsl:template>
</xsl:stylesheet>