<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support AN Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFAN__MasterArea"> 
		   <xsl:call-template name="plan"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plan">  
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
		<xsl:text>Record Number:   </xsl:text>		
		<xsl:value-of select="__RECORD__NUMBER" />
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
		<xsl:text>*************************</xsl:text>
		<xsl:text>&#10;</xsl:text>	
		<xsl:text>Tran Code,</xsl:text>	
		<xsl:text>Primary Logic,</xsl:text>	
		<xsl:text>Key1 Use,</xsl:text>
		<xsl:text>Compare Key,</xsl:text>
		<xsl:text>Line of Business,</xsl:text>
		<xsl:text>Pension Code,</xsl:text>
		<xsl:text>Par Type,</xsl:text>
		<xsl:text>Option 1,</xsl:text>
		<xsl:text>Option 2,</xsl:text>
		<xsl:text>Duration Use,</xsl:text>
		<xsl:text>Thru Duration,</xsl:text>
		<xsl:text>Account Number,</xsl:text>
		<xsl:text>CV SW,</xsl:text>
		<xsl:text>CB SW,</xsl:text>
		<xsl:text>RT SW</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFAN__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFAN__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__TRANS__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRIMARY__LOGIC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__KEY__1__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LINE__OF__BUSINESS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PENSION__INDICATOR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PAR__TYPE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PAR__OPTION__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PAR__OPTION__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__THRU__DURA__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__THRU__DURATION" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCOUNT__NUMBERS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CASH__VALUE__EFF__SW" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__COST__BASIS__EFF__SW" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__REMOTE__XFER__IND" />
		<xsl:text>"</xsl:text>	
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 	
</xsl:stylesheet>