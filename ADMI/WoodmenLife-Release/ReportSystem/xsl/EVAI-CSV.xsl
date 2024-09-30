<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support EVAI CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>
  	
  	<xsl:template match="XML__ReportExtract">  	
		<xsl:apply-templates select="reportExtractSet/REPT__EVAI__Extract" />
	</xsl:template>
  	
	<xsl:template match="REPT__EVAI__Extract">
		<!-- Start by printing the report heading -->
		
		<xsl:text>CO. </xsl:text><xsl:value-of select="//companyCode" /><xsl:text> REPORT </xsl:text><xsl:value-of select="//reportID" />
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="heading1" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="from_Month" select="substring(//fromDate, 6, 2)"/>
		<xsl:variable name="from_Day" select="substring(//fromDate, 9)"/>
		<xsl:variable name="from_Year" select="substring(//fromDate, 1, 4)"/>
		<xsl:variable name="from_Date" select="concat($from_Month, '-', $from_Day, '-', $from_Year)" />
		<xsl:text>From </xsl:text><xsl:value-of select="$from_Date" />
		<xsl:variable name="thru_Month" select="substring(//thruDate, 6, 2)"/>
		<xsl:variable name="thru_Day" select="substring(//thruDate, 9)"/>
		<xsl:variable name="thru_Year" select="substring(//thruDate, 1, 4)"/>
		<xsl:variable name="thru_Date" select="concat($thru_Month, '-', $thru_Day, '-', $thru_Year)" />
		<xsl:text> Thru </xsl:text><xsl:value-of select="$thru_Date" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="rept_Month" select="substring(//reportDate, 6, 2)"/>
		<xsl:variable name="rept_Day" select="substring(//reportDate, 9)"/>
		<xsl:variable name="rept_Year" select="substring(//reportDate, 1, 4)"/>
		<xsl:variable name="rept_Date" select="concat($rept_Month, '-', $rept_Day, '-', $rept_Year)" />
		<xsl:text>Date </xsl:text><xsl:value-of select="$rept_Date" />
		<xsl:text> Time </xsl:text><xsl:value-of select="//reportTime" />
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="heading2" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By: </xsl:text><xsl:value-of select="//printedBy" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<xsl:if test="count(detailLines) > '0'">
			<xsl:text>Request Number: </xsl:text><xsl:value-of select="requestNumber" />
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			
			<!--,Policy Number,Coverage Number,Sub Coverage,AI Type,Annuity Start Date,Maturity Date,Next Date of Payment,Error Connector,Error Code -->
			<xsl:text>,Policy,Cov,Sub,AI,Annuity,Maturity,Next Date,Next,*********,ERROR ********</xsl:text>
			<xsl:text>,Number,Num,Cov,Type,St Date,Date,of Payment,Payment,Connector,Code</xsl:text>

			<xsl:apply-templates select="detailLines/REPT__EVAI__DetailLine" />
			
			<xsl:text>Total Errors for Request Number: </xsl:text><xsl:value-of select="requestNumber" />
			<xsl:text>,</xsl:text><xsl:value-of select="count(detailLines)" />
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template match="REPT__EVAI__DetailLine">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverageNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="subCovNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="aiType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="startDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="maturityDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="nextPaymentDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(paymentAmount, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="errorConnector" /><xsl:text>,</xsl:text>
		<xsl:value-of select="errorCode" /><xsl:text>,</xsl:text>
	</xsl:template>
</xsl:stylesheet>