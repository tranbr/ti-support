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
		<xsl:text>Access:   </xsl:text>		
		<xsl:value-of select="__ACCESS__KEY" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Que:   </xsl:text>		
		<xsl:value-of select="__QUE__KEY" />		
		<xsl:text>,</xsl:text>
		<xsl:text>Plan Type:   </xsl:text>		
		<xsl:value-of select="__PLAN__CODE__TYPE" />		
		<xsl:if test="__TABLE__TYPE">
			<xsl:text>,</xsl:text>
			<xsl:text>Table Type:   </xsl:text>		
			<xsl:value-of select="__TABLE__TYPE" />		
		</xsl:if>
		<xsl:if test="__TABLE__ID">
			<xsl:text>,</xsl:text>
			<xsl:text>Table ID:   </xsl:text>		
			<xsl:value-of select="__TABLE__ID" />		
		</xsl:if>
		<xsl:if test="__TABLE__SUB__TYPE">
			<xsl:text>,</xsl:text>
			<xsl:text>Table Subtype:   </xsl:text>		
			<xsl:value-of select="__TABLE__SUB__TYPE" />
		</xsl:if>		
		<xsl:if test="__TABLE__SUB__ID">
			<xsl:text>,</xsl:text>
			<xsl:text>Table SubID:   </xsl:text>		
			<xsl:value-of select="__TABLE__SUB__ID" />
		</xsl:if>		
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
	</xsl:template> 
</xsl:stylesheet>