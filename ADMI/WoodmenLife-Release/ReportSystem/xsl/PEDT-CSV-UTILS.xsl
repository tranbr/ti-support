<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
    <xsl:template name="header1">  
    	<xsl:text>&#10;</xsl:text>
		<xsl:text>*************************</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Section Code:   </xsl:text>		
		<xsl:value-of select="__SECTION__CODE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Plan Code:   </xsl:text>		
		<xsl:value-of select="__PLAN__CODE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Plan Type:   </xsl:text>		
		<xsl:value-of select="__PLAN__CODE__TYPE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Benefit:   </xsl:text>		
		<xsl:value-of select="__BENEFIT__TYPE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Access:   </xsl:text>		
		<xsl:value-of select="__ACCESS__KEY" />		
		<xsl:text>,</xsl:text>	
		<xsl:text>Que:   </xsl:text>			
		<xsl:value-of select="__QUE__KEY" />		
		<xsl:text>,</xsl:text>
		<xsl:text>DP Desk:   </xsl:text>		
		<xsl:value-of select="__DPDESK__NEW" />	
		<xsl:text>&#10;</xsl:text>	
		<xsl:text>Record #:   </xsl:text>		
		<xsl:value-of select="__RECORD__NUMBER" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Date New:   </xsl:text>
		<xsl:variable name="newMonth" select="substring(__DATE__NEW, 6, 2)"/>
		<xsl:variable name="newDay" select="substring(__DATE__NEW, 9)"/>
		<xsl:variable name="newYear" select="substring(__DATE__NEW, 1, 4)"/>
		<xsl:variable name="newDate" select="concat($newMonth, '-', $newDay, '-', $newYear)" />		
		<xsl:value-of select="$newDate" />		
		<xsl:text>,</xsl:text>
		<xsl:text>DUP Number:   </xsl:text>		
		<xsl:value-of select="__DUPLICATION__NUMBER" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Last Maintenance Date:   </xsl:text>
		<xsl:variable name="lastMaintMonth" select="substring(__MAINT__EIBDATE, 6, 2)"/>
		<xsl:variable name="lastMaintDay" select="substring(__MAINT__EIBDATE, 9)"/>
		<xsl:variable name="lastMaintYear" select="substring(__MAINT__EIBDATE, 1, 4)"/>
		<xsl:variable name="lastMaintDate" select="concat($lastMaintMonth, '-', $lastMaintDay, '-', $lastMaintYear)" />	
		<xsl:value-of select="$lastMaintDate" />		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>*************************</xsl:text>
		<xsl:text>&#10;</xsl:text>	
	</xsl:template> 
   <xsl:template name="header2">  
		<xsl:text>Duration:   </xsl:text>		
		<xsl:value-of select="__THRU__DURATION" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Age:   </xsl:text>		
		<xsl:value-of select="__ISSUE__AGE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Coverage Number:   </xsl:text>		
		<xsl:value-of select="__TYPE__OF__COVERAGE" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Sex Code:   </xsl:text>		
		<xsl:value-of select="__SEX__CODE" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>*************************</xsl:text>
		<xsl:text>&#10;</xsl:text>	
	</xsl:template> 	
</xsl:stylesheet>