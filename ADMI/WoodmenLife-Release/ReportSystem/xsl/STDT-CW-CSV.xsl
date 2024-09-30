<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support CW Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFCW__MasterArea"> 
		   <xsl:call-template name="plcw"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plcw">  
   	<xsl:text>&#10;</xsl:text>
		<xsl:text>*************************</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Section Code:   </xsl:text>		
		<xsl:value-of select="__SECTION__CODE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Access:   </xsl:text>		
		<xsl:value-of select="__ACCESS__KEY" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Que:   </xsl:text>		
		<xsl:value-of select="__QUE__KEY" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Plan Type:   </xsl:text>		
		<xsl:value-of select="__PLAN__CODE__TYPE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Table Type:   </xsl:text>		
		<xsl:value-of select="__TABLE__TYPE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Table Subtype:   </xsl:text>		
		<xsl:value-of select="__TABLE__SUB__TYPE" />
		<xsl:text>,</xsl:text>
		<xsl:text>CWAP ID:   </xsl:text>		
		<xsl:value-of select="__CWAP__ID" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Date New:   </xsl:text>
		<xsl:variable name="new_Month" select="substring(__DATE__NEW, 6, 2)"/>
		<xsl:variable name="new_Day" select="substring(__DATE__NEW, 9)"/>
		<xsl:variable name="new_Year" select="substring(__DATE__NEW, 1, 4)"/>
		<xsl:variable name="new_Date" select="concat($new_Month, '-', $new_Day, '-', $new_Year)" />
		<xsl:value-of select="$new_Date" />		
		<xsl:text>,</xsl:text>
		<xsl:text>DUP Number:   </xsl:text>		
		<xsl:value-of select="__DUPLICATION__NUMBER" />		
		<xsl:text>,</xsl:text>
		<xsl:text>DP Desk:   </xsl:text>		
		<xsl:value-of select="__DPDESK__NEW" />	
		<xsl:text>,</xsl:text>		
		<xsl:text>Last Maintenance Date:   </xsl:text>	
		<xsl:variable name="maint_Month" select="substring(__MAINT__EIBDATE, 6, 2)"/>
		<xsl:variable name="maint_Day" select="substring(__MAINT__EIBDATE, 9)"/>
		<xsl:variable name="maint_Year" select="substring(__MAINT__EIBDATE, 1, 4)"/>
		<xsl:variable name="maint_Date" select="concat($maint_Month, '-', $maint_Day, '-', $maint_Year)" />
		<xsl:value-of select="$maint_Date" />		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Description:   </xsl:text>
		<xsl:value-of select="__TABLE__DESCRIPTION" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>*************************</xsl:text>
		<xsl:text>&#10;</xsl:text>	
		<xsl:text>Tran Code,</xsl:text>	
		<xsl:text>Amount Indicator,</xsl:text>	
		<xsl:text>Number Type,</xsl:text>
		<xsl:text>Batch Number,</xsl:text>
		<xsl:text>Account Number,</xsl:text>
		<xsl:text>Description</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFCW__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFCW__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__TRANS__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__AMOUNT__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NUMBER__TYPE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__BATCH__NUMBER" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCOUNT__NUMBER" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DESCRIPTION" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>