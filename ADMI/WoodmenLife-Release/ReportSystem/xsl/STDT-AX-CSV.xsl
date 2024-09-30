<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support AX Section for STDT CSV XSL Transformation Process -->	
	<xsl:template match="/">
   	<xsl:apply-templates select="XML__ReportExtract" />
   	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	   <xsl:call-template name="mainHeader1"/>
	   <xsl:for-each select="reportExtractSet/PFAX__MasterArea">		
          <xsl:call-template name="plax" />
 	   </xsl:for-each>
	</xsl:template>		
	<xsl:template name="plax">	 
	    <xsl:call-template name="header1"/>  
		<xsl:text>Company Code,</xsl:text>
		<xsl:text>TRAN Code,</xsl:text>
		<xsl:text>In Fund XFER,</xsl:text>
		<xsl:text>Description,</xsl:text>
		<xsl:text>Offsets</xsl:text>	
		<xsl:text>&#10;</xsl:text>
		<xsl:choose>
           <xsl:when test="__PFAX__EntrySet/PFAX__Entry"> 
              <xsl:for-each select="__PFAX__EntrySet/PFAX__Entry"> 
		         <xsl:call-template name="plaxEntry" />
              </xsl:for-each>
           </xsl:when>
           <xsl:otherwise>
              <xsl:text>"</xsl:text>
		      <xsl:value-of select="__COMPANY__CODE" />
			  <xsl:text>"</xsl:text>
			  <xsl:text>,</xsl:text>
			  <xsl:text>"</xsl:text>
			  <xsl:value-of select="__TRANS__CODE" />
			  <xsl:text>"</xsl:text>
			  <xsl:text>,</xsl:text>
			  <xsl:text>"</xsl:text>
			  <xsl:value-of select="__INTERFUND__IND" />
			  <xsl:text>"</xsl:text>
			  <xsl:text>,</xsl:text>
			  <xsl:text>"</xsl:text>
			  <xsl:value-of select="__DESCRIPTION" />
			  <xsl:text>"</xsl:text> 
			  <xsl:text>&#10;</xsl:text>                      
           </xsl:otherwise>
        </xsl:choose>	
	</xsl:template>
	<xsl:template name="plaxEntry"> 	    
	   	<xsl:text>"</xsl:text>
		<xsl:value-of select="../../__COMPANY__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../__TRANS__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../__INTERFUND__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../__DESCRIPTION" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__OFFSETS" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>