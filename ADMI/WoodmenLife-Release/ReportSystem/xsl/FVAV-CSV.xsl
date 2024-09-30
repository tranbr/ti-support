<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support FVAV CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>
  	
  	<xsl:template match="XML__ReportExtract">  	
		<xsl:apply-templates select="reportExtractSet/REPT__FVAV__Extract" />
	</xsl:template>
  	
	<xsl:template match="REPT__FVAV__Extract">
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
			
			<xsl:apply-templates select="coverageHeading" />
			
			<!-- ,Account Id,Reserve Id,Fund Class Code,Disb Units,Disbursement Amount,Current Value,Share Units -->
			<xsl:text>,Account,Rsrv,Class,Disb,Disbursement,Current,Share&#10;</xsl:text>
			<xsl:text>,Id,Id,Code,Units,Amounts,Value,Units</xsl:text>
			
			<xsl:apply-templates select="detailLines/REPT__FVAV__FundAmounts" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<!-- Totals must exist and would be their own page on the PDF -->
		<xsl:apply-templates select="fvavTotals" />
		
	</xsl:template>
	
	<xsl:template match="detailHeading">
		<xsl:text>,Request Number: </xsl:text><xsl:value-of select="requestNumber" />
		<xsl:text>,Line of Business: </xsl:text><xsl:value-of select="lineOfBusiness" />
		<xsl:text>,Plan Code: </xsl:text><xsl:value-of select="planCode" />
		<xsl:text>,Plan Code Sub: </xsl:text><xsl:value-of select="planCodeSub" />
		<xsl:text>,Policy Number: </xsl:text><xsl:value-of select="policyNumber" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template match="coverageHeading">
		<xsl:text>,,Cov,Sub,Orig Purchase,Gross&#10;</xsl:text>
		<xsl:text>,,No,Cov,Price,Disbursement&#10;</xsl:text>
		<xsl:text>,,</xsl:text>
		<xsl:value-of select="covNum" /><xsl:text>,</xsl:text>
		<xsl:value-of select="subCov" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(origPurchPrice, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossDisb, '########0.00')" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template match="fvavTotals">
	
		<xsl:if test="count(coverageTotals) > '0'">
			<xsl:apply-templates select="coverageTotals" />
			
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

		<xsl:if test="count(policyTotals) > '0'">
			<xsl:apply-templates select="policyTotals" />
			
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(minorTotals) > '0'">
			<!-- A minor break is a break on plan code and would start a new page on the PDF -->
			<xsl:apply-templates select="minorTotals" />
			
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			
			<xsl:if test="count(ptTable) > '0'">
				<!-- ,Account Id,Reserve Id,Class Code,Payout Disb Units,As of Disb Amount,Variable Account Value,Variable Share Units -->
				<xsl:text>,Account,Reserve,Class,Payout,As of Disb,Variable,Variable&#10;</xsl:text>
				<xsl:text>,Id,Id,Code,Disb Units,Amount,Acct Value,Share Units</xsl:text>
			
				<xsl:apply-templates select="ptTable/REPT__FVAV__FundAmounts" />
			
				<xsl:text>&#10;</xsl:text>
				<xsl:text>&#10;</xsl:text>
			</xsl:if>
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
		
		<xsl:if test="count(avTable) > '0'">
			<!-- Company Break -->
			<xsl:text>Company Code: </xsl:text><xsl:value-of select="companyCode" />
			
			<!-- ,Account Id,Reserve Id,Class Code,Payout Disb Units,As of Disb Amount,Variable Account Value,Variable Share Units -->
			<xsl:text>,Account,Reserve,Class,Payout,As of Disb,Variable,Variable&#10;</xsl:text>
			<xsl:text>,Id,Id,Code,Disb Units,Amount,Acct Value,Share Units</xsl:text>

			<xsl:apply-templates select="avTable/REPT__FVAV__FundAmounts" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(finalTotals) > '0'">
			<!-- Final Totals would start a new page on the PDF -->
			<xsl:text>* * * * Totals * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<!-- ,Complete Totals of All Companies,Orig Purchase Amount,Gross Disbursement,Payout Disb Units,As of Disbursement Amount,Variable Acc Value -->
			<xsl:text>,Complete Totals,Orig Purchase,Gross,Payout,As Of Disbursement,Variable&#10;</xsl:text>
			<xsl:text>,of All Companies,Amount,Disbursement,Disb Units,Amount,Acc Value</xsl:text>
		
			<xsl:text>&#10;,,</xsl:text>
		
			<xsl:apply-templates select="totals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="coverageTotals">
		<xsl:text>* * * * Totals * * * *</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<!-- Cov Sub Cov,Policy Number,As of Disb Amount,Var Payout Acc Value -->
		<xsl:text>,Cov,Policy,As of Disb,Var Payout&#10;</xsl:text>
		<xsl:text>,Sub Cov,Number,Amount,Acc Value&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="covNum" /><xsl:text>,</xsl:text>
		<xsl:value-of select="subCov" /><xsl:text>,</xsl:text>
		<xsl:value-of select="policyNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(covDisbAmount, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(covAccValue, '########0.00')" />
	</xsl:template>
	
	<xsl:template match="policyTotals">
		<xsl:text>* * * * Totals * * * *</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<!-- Policy Number,Orig Purchase Amount,Gross Disbursement,Payout Disb Units,As of Disbursement Amount,Variable Acc Value -->
		<xsl:text>,Policy,Orig Purchase,Gross,Payout,As of Disbursement,Variable&#10;</xsl:text>
		<xsl:text>,Number,Amount,Disbursement,Disb Units,Amount,Acc Value&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="policyNumber" /><xsl:text>,</xsl:text>

		<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="minorTotals">
		<xsl:apply-templates select="detailHeading" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<!-- Plan Code,Orig Purchase Amount,Gross Disbursement,Payout Disb Units,As of Disbursement Amount,Variable Acc Value -->
		<xsl:text>,Plan,Orig Purchase,Gross,Payout,As of Disbursement,Variable&#10;</xsl:text>
		<xsl:text>,Code,Amount,Disbursement,Disb Units,Amount,Acc Value&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:text>,</xsl:text>

		<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="interTotals">
		<!-- Line of Business,Orig Purchase Amount,Gross Disbursement,Payout Disb Units,As of Disbursement Amount,Variable Acc Value -->
		<xsl:text>,Line of,Orig Purchase,Gross,Payout,As of Disbursement,Variable&#10;</xsl:text>
		<xsl:text>,Business,Amount,Disbursement,Disb Units,Amount,Acc Value&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:text>,</xsl:text>

		<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="majorTotals">
		<!-- Report Date,Request Number,Orig Purchase Amount,Gross Disbursement,Payout Disb Units,As of Disbursement Amount,Variable Acc Value -->
		<xsl:text>,Report,Request,Orig Purchase,Gross,Payout,As of Disbursement,Variable&#10;</xsl:text>
		<xsl:text>,Date,Number,Amount,Disbursement,Disb Units,Amount,Acc Value&#10;</xsl:text>

		<xsl:text>,</xsl:text>
		<xsl:value-of select="reportDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="requestNumber" /><xsl:text>,</xsl:text>

		<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="totals">
		<xsl:value-of select="format-number(origPruchAmt, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossDisb, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(payoutDisbUnits, '########0.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(disbAmt, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(acctValue, '########0.00')" />
	</xsl:template>
	
	<xsl:template match="REPT__FVAV__FundAmounts">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="accountId" /><xsl:text>,</xsl:text>
		<xsl:value-of select="reserved2" /><xsl:text>,</xsl:text>
		<xsl:value-of select="classCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(disbUnits, '########0.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(disbAmount, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(currValue, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(currUnits, '########0.000000')" />
	</xsl:template>
</xsl:stylesheet>