<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
 	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support ADYN CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="reportHeader"/>
  	    <xsl:for-each select="reportExtractSet/ADYN__ReportMaster"> 
  	  		<xsl:call-template name="masterLineHeader"/>  	    
		   	<xsl:call-template name="adyn"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="reportHeader">  
	    <xsl:text>Company Code:  </xsl:text><xsl:value-of select="./companyCode" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Company Name:  </xsl:text><xsl:value-of select="./companyName" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Description:  </xsl:text><xsl:value-of select="./reportDescription" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report ID:  </xsl:text><xsl:value-of select="./reportID" />
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>Report Time:  </xsl:text><xsl:value-of select="./reportTime" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By:  </xsl:text><xsl:value-of select="./printedBy" />	
		<xsl:text>&#10;</xsl:text>		
	</xsl:template>
	<xsl:template name ="masterLineHeader">  
	    <xsl:text>&#10;</xsl:text>
    	<xsl:text>Calculation Basis,</xsl:text>
		<xsl:text>Plan Type,</xsl:text>
		<xsl:text>FE Plan Code,</xsl:text>
		<xsl:text>Plan Code Sub Type,</xsl:text>
		<xsl:text>Coverage Type,</xsl:text>
		<xsl:text>Sex Type,</xsl:text>
		<xsl:text>Issue Age,</xsl:text>
		<xsl:text>Extract Type</xsl:text>
		<xsl:text>&#10;</xsl:text> 

	</xsl:template>
	<xsl:template name="adyn">
		<xsl:text>"</xsl:text><xsl:value-of select="__calculationBasis" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__planType" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__fePlanCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__planCodeSub" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__coverageType" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__sexType" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__issueAge" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__extractType" /><xsl:text>"</xsl:text>	
		<xsl:text>&#10;</xsl:text>
		<xsl:text>**********************************************************************</xsl:text>
		<xsl:text>&#10;</xsl:text>				 
		<xsl:for-each select="__scalarEntrySet/ADYN__Scalar__Entry"> 
		  	<xsl:call-template name="scalarLineHeader"/>
		  	<xsl:call-template name="adynScalar"/>
		</xsl:for-each>
		<xsl:for-each select="__errorEntrySet/ADYN__Error__Entry"> 
		  	<xsl:call-template name="errorLineHeader"/>
		  	<xsl:call-template name="adynError"/>
		</xsl:for-each>
		<xsl:for-each select="__tableEntrySet/ADYN__Table__Entry"> 
		  	<xsl:call-template name="tableLineHeader"/>
		  	<xsl:call-template name="adynTable"/>
		</xsl:for-each>		
	</xsl:template>			
	<xsl:template name ="scalarLineHeader">  
    	<xsl:text>Value Type,</xsl:text>
		<xsl:text>Description,</xsl:text>
		<xsl:text>Scalar Value,</xsl:text>
		<xsl:text>Scalar Date,</xsl:text>
		<xsl:text>Scalar Text</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
	<xsl:template name="adynScalar">
		<xsl:text>"</xsl:text><xsl:value-of select="__valueType" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__scalarDescription" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__scalarValue" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="scalarMonth" select="substring(__scalarDate, 6, 2)"/>
		<xsl:variable name="scalarDay" select="substring(__scalarDate, 9)"/>
		<xsl:variable name="scalarYear" select="substring(__scalarDate, 1, 4)"/>
		<xsl:variable name="scalarDate" select="concat($scalarMonth, '-', $scalarDay, '-', $scalarYear)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$scalarDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__scalarText" /><xsl:text>"</xsl:text>	
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>		
	<xsl:template name ="errorLineHeader">  
    	<xsl:text>Return Code,</xsl:text>
		<xsl:text>Message Code,</xsl:text>
		<xsl:text>Error Connector</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
	<xsl:template name="adynError">
		<xsl:text>"</xsl:text><xsl:value-of select="__errorReturn" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__errorMessageCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__errorConnector" /><xsl:text>"</xsl:text>	
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>							
	<xsl:template name ="tableLineHeader">  
    	<xsl:text>Table Value,</xsl:text>
		<xsl:text>Table Description,</xsl:text>
		<xsl:text>Error Connector</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
	<xsl:template name="adynTable">
		<xsl:text>"</xsl:text><xsl:value-of select="__tableValueType" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__tableDescription" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>Table Values:   </xsl:text>
		<xsl:for-each select="__tableValue/string">
			<xsl:if test="text()">
				<xsl:value-of select="." />
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>								
</xsl:stylesheet>