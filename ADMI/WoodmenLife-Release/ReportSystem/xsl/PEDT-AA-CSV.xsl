<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support AA Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFAA__MasterArea"> 
		   <xsl:call-template name="plaa"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plaa">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>
		<xsl:text>Short Name,</xsl:text>	
		<xsl:text>Long Name,</xsl:text>	
		<xsl:text>Low Age,</xsl:text>
		<xsl:text>High Age,</xsl:text>
		<xsl:text>Low Policy,</xsl:text>
		<xsl:text>High Policy,</xsl:text>
		<xsl:text>CUSIP Number</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__PLAN__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LONG__NAME" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LOW__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__HIGH__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LOW__POLICY" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__HIGH__POLICY" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CUSIP" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
		<xsl:text>&#10;</xsl:text>  		
		<xsl:text>Approval State,</xsl:text>
		<xsl:text>Approval Date,</xsl:text>
		<xsl:text>Withdraw Date,</xsl:text>
		<xsl:text>Issue Days,</xsl:text>
		<xsl:text>Approval Days,</xsl:text>
		<xsl:text>Exception Codes</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
		<xsl:apply-templates select="__PFAA__EntrySet" />
		<xsl:text>Sections:   </xsl:text>
		<xsl:for-each select="__SECTION/string">
			<xsl:if test="text()">
				<xsl:value-of select="." />
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Old DP Desk:   </xsl:text>
		<xsl:value-of select="__DPDESK__OLD" />
		<xsl:text>,</xsl:text>
		<xsl:text>Old Date:   </xsl:text>
		<xsl:variable name="oldMonth" select="substring(__DATE__OLD, 6, 2)"/>
		<xsl:variable name="oldDay" select="substring(__DATE__OLD, 9)"/>
		<xsl:variable name="oldYear" select="substring(__DATE__OLD, 1, 4)"/>
		<xsl:variable name="oldDate" select="concat($oldMonth, '-', $oldDay, '-', $oldYear)" />
		<xsl:value-of select="$oldDate" />
		<xsl:text>,</xsl:text>
		<xsl:text>Old Time:   </xsl:text>
		<xsl:value-of select="__TIME__OLD" />
		<xsl:text>&#10;</xsl:text>  		
    </xsl:template>		
    <xsl:template match="PFAA__Entry">	
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__APPROVAL__STATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="appMonth" select="substring(__APPROVAL__DATE, 6, 2)"/>
		<xsl:variable name="appDay" select="substring(__APPROVAL__DATE, 9)"/>
		<xsl:variable name="appYear" select="substring(__APPROVAL__DATE, 1, 4)"/>
		<xsl:variable name="appDate" select="concat($appMonth, '-', $appDay, '-', $appYear)" />
		<xsl:value-of select="$appDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="wdMonth" select="substring(__WITHDRAWN__DATE, 6, 2)"/>
		<xsl:variable name="wdDay" select="substring(__WITHDRAWN__DATE, 9)"/>
		<xsl:variable name="wdYear" select="substring(__WITHDRAWN__DATE, 1, 4)"/>
		<xsl:variable name="wdDate" select="concat($wdMonth, '-', $wdDay, '-', $wdYear)" />
		<xsl:value-of select="$wdDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ISSUE__DAYS__PRIOR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__APPL__DAYS__PRIOR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>	
		<xsl:for-each select="__EXCEPTION__CODES/string">
		<xsl:if test="text()" >
		   <xsl:value-of select='.' />
           <xsl:text> </xsl:text>
        </xsl:if>		
		</xsl:for-each>
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
</xsl:stylesheet>