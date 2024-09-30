<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support FVLD CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>
  	
  	<xsl:template match="XML__ReportExtract">  	
		<xsl:apply-templates select="reportExtractSet/REPT__ValuationDeposit__Extract" />
	</xsl:template>
  	
	<xsl:template match="REPT__ValuationDeposit__Extract">
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
			
			<xsl:apply-templates select="detailHeading" />
			
			<!-- ,Policy Number,Cov No,Sub Cov,Guar Ind,New Rate,Old Rate,Interest Amount,Deposit Amount -->
			<xsl:text>,Policy,Cov,Sub,Guar,New,Old,Interest,Deposit&#10;</xsl:text>
			<xsl:text>,Number,No,Cov,Ind,Rate,Rate,Amount,Amount</xsl:text>
			
			<xsl:apply-templates select="detailLines/REPT__ValuationDeposit__DetailLine" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<!-- Totals must exist and would be their own page on the PDF -->
		<xsl:apply-templates select="depositTotals" />
		
	</xsl:template>
	
	<xsl:template match="detailHeading">
		<xsl:text>,Request Number: </xsl:text><xsl:value-of select="requestNumber" />
		<xsl:text>,Line of Business: </xsl:text><xsl:value-of select="lineOfBusiness" />
		<xsl:text>,Plan Code: </xsl:text><xsl:value-of select="planCode" />
		<xsl:text>,Plan Code Sub: </xsl:text><xsl:value-of select="planCodeSub" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template match="REPT__ValuationDeposit__DetailLine">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="policyNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverageNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="subCovNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="guaranteedInd" /><xsl:text>,</xsl:text>
		<xsl:value-of select="newMoneyRateCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="oldMoneyRateCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(interest, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(depositAmount, '########0.00')" />
	</xsl:template>
	
	<xsl:template match="depositTotals">
	
		<xsl:if test="count(minorTotals) > '0'">
			<xsl:apply-templates select="minorTotals" />
			
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

		<xsl:if test="count(interTotals) > '0'">
			<xsl:apply-templates select="interTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(majorTotals) > '0'">
			<xsl:apply-templates select="majorTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(cmpnyTotals) > '0'">
			<xsl:apply-templates select="cmpnyTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(finalTotals) > '0'">
			<!-- Final Totals would start a new page on the PDF -->
			<xsl:text>* * * * Totals * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<!-- ,Complete Totals of All Companies,,,Interest Amount,Deposit Amount -->
			<xsl:text>,Complete Totals,,,Interest,Deposit&#10;</xsl:text>
			<xsl:text>,of All Companies,,,Amount,Amount</xsl:text>
		
			<xsl:text>&#10;,,,,</xsl:text>
		
			<xsl:apply-templates select="totals" />
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="minorTotals">
		<xsl:text>* * * * Totals * * * *</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<!-- Coverage Type,Plan Code,Sub Plan,Interest Amount,Deposit Amount -->
		<xsl:text>,Coverage,Plan,Sub,Interest,Deposit&#10;</xsl:text>
		<xsl:text>,Type,Code,Plan,Amount,Amount&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="coverageType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planCodeSubType" /><xsl:text>,</xsl:text>

		<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="interTotals">
		<!-- Line of Business,,,Interest Amount,Deposit Amount -->
		<xsl:text>,Line of,,,Interest,Deposit&#10;</xsl:text>
		<xsl:text>,Business,,,Amount,Amount&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="lineOfBusiness" /><xsl:text>,,,</xsl:text>

		<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="majorTotals">
		<!-- Report Date,Request Number,,Interest Amount,Deposit Amount -->
		<xsl:text>,Report,Request,,Interest,Deposit&#10;</xsl:text>
		<xsl:text>,Date,Number,,Amount,Amount&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="reportDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="requestNumber" /><xsl:text>,,</xsl:text>

		<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="cmpnyTotals">
		<!-- Company Code,,,Interest Amount,Deposit Amount -->
		<xsl:text>,Company,,,Interest,Deposit&#10;</xsl:text>
		<xsl:text>,Code,,,Amount,Amount&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="companyCode" /><xsl:text>,,,</xsl:text>

		<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="totals">
		<xsl:value-of select="format-number(interest, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(deposit, '########0.00')" />
	</xsl:template>
</xsl:stylesheet>