<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support CP Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFCP__MasterArea"> 
		   <xsl:call-template name="plcp"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plcp">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>		
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Use Code,</xsl:text>
		<xsl:text>Table ID,</xsl:text>
		<xsl:text>Non Qual Benefit Process,</xsl:text>
		<xsl:text>Interest Override,</xsl:text>
		<xsl:text>Guideline Compliance Rule,</xsl:text>
		<xsl:text>TAMRA Compliance Rule,</xsl:text>
		<xsl:text>Negative Guideline Rule,</xsl:text>
		<xsl:text>Negative Amount Paid Rule,</xsl:text>
		<xsl:text>Negative Premium Paid Rule,</xsl:text>
		<xsl:text>Age Decrement/Iterative Calc,</xsl:text>
		<xsl:text>NLG Forgive WOC,</xsl:text>
		<xsl:text>7702 Amnt Paid Rule,</xsl:text>
		<xsl:text>Extend 7-Pay Rule,</xsl:text>
		<xsl:text>Sim Test Rule,</xsl:text>
		<xsl:text>TEFRA/TAMRA Indicator,</xsl:text>
		<xsl:text>NLG Benefit Type,</xsl:text>
		<xsl:text>NLG CY01 ID,</xsl:text>
		<xsl:text>NLG Forgive WOC,</xsl:text>
		<xsl:text>Processing Order Premiums,</xsl:text>
		<xsl:text>Processing Order Surrender Charges,</xsl:text>
		<xsl:text>Processing Order Regulatory Amounts,</xsl:text>
		<xsl:text>Processing Order Commissions</xsl:text>
		<xsl:text>&#10;</xsl:text> 		
		<xsl:apply-templates select="__PFCP__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFCP__Entry">	
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
		<xsl:value-of select="__DATE__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CX__TABLE__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NQAB__PROC__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__INT__MAN__OVER" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__GDLN__COMP__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TAMRA__COMP__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__GDLN__NEG__ALLOW" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__AMTS__PD__NEG__ALLOW" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PREM__PD__NEG__ALLOW" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__AGE__DECR__ITER" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NLG__FORGIVE__WOC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__S7702A__AMTPD__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__EXTEND__7PAY__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SIM__TEST__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TTGUAR__IN01__ID" />
		<xsl:text>"</xsl:text>
		<xsl:for-each select="__PFCP__SubEntrySet/PFCP__SubEntry" >
			<xsl:choose>
				<xsl:when test="count(preceding-sibling::PFCP__SubEntry) = 0">
					<xsl:text>,"</xsl:text>
					<xsl:value-of select="__NLG__BEN__TYPE" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="__NLG__CY01__TBLID"></xsl:value-of>
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="../../__CPCC__COMM" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="../../__CPCC__PREM" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="../../__CPCC__SURR" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="../../__CPCC__REGU" />
					<xsl:text>"</xsl:text>
					<xsl:text>&#10;</xsl:text> 
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="normalize-space(__NLG__BEN__TYPE)">
						<xsl:text>"","","","","","","","","","","","","","","","","","","</xsl:text>
						<xsl:value-of select="__NLG__BEN__TYPE" />
						<xsl:text>"</xsl:text>
						<xsl:text>,</xsl:text>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="__NLG__CY01__TBLID"></xsl:value-of>
						<xsl:text>","","","",""</xsl:text>
						<xsl:text>&#10;</xsl:text> 
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>