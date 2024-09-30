<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support WJBN CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>
  	
  	<xsl:template match="XML__ReportExtract">  	
		<xsl:apply-templates select="reportExtractSet/REPT__WJBN__Extract" />
	</xsl:template>
  	
	<xsl:template match="REPT__WJBN__Extract">
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
		
		<!-- We potentially have three different types of data to display. -->
		<!--      Detail Records  (see APVWBP00.modifier.charAt(5))        -->
		<!--      Segment Records (see APVWBP00.modifier.charAt(6))        -->
		<!--      Totals                                                   -->
		<!-- At a minimum, we have Totals to print.                        -->
		
		<xsl:if test="count(detailLines) > '0'">
			<!-- Detail Lines would be their own page on the PDF -->
			
			<xsl:apply-templates select="detailHeading" />

			<!-- ,Policy Number,Coverage Number,Sub Coverage,Issue Date,Paid To Date,Valuation Age,Interpolation Option,Current Duration, -->
			<!-- Policy Count,Number Of Units,Benefit Type,Benefit Amount,Total Reserve,Total Reserve Adjustment,Total Net Premium -->
			<xsl:text>,Policy,Cov,Sub,Issue,Paid To,Val,Int,Cur,Pol,Number,Benf,,Total,Total Reserve,Total&#10;</xsl:text>
			<xsl:text>,Count,Num,Cov,Date,Date,Age,Opt,Dur,Cnt,of Units,Type,Benefit,Reserve,Adjustment,Net Premium</xsl:text>

			<xsl:apply-templates select="detailLines/REPT__WJBN__DetailLine" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<!-- Each type of segment would be its own page on the PDF, if they exist -->
		
		<xsl:if test="count(segmentLines__A) > '0'">
			<xsl:text>* * * * A Segments * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
			
			<xsl:apply-templates select="detailHeading" />
			
			<!-- ,Policy Number,CSB No,Status Code,Annualized Gross Premium,Account Value,Surrender Value,WIN Date,Winner Stream Value,Winner Stream No,Net Duration Contribution -->
			<xsl:text>,Policy,CSB,Status,Annualized,Account,Surrender,WIN,Winner,Winner,Net Duration&#10;</xsl:text>
			<xsl:text>,Number,CSB,Code,Gross Premium,Value,Value,Date,Stream Value, Stream No,Contribution</xsl:text>

			<xsl:apply-templates select="segmentLines__A/REPT__WJBN__Segment">
				<xsl:with-param name="segType">A</xsl:with-param>
			</xsl:apply-templates>

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(segmentLines__C) > '0'">
			<xsl:text>* * * * C Segments * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
			
			<xsl:apply-templates select="detailHeading" />
			
			<!-- ,Policy Number,CSB No,Status Code,Annualized Gross Premium,Factor Type,Low Reserve Factor Per Unit,High Reserve Factor Per Unit,Net Premium Factor Per Unit,One Year Net Premium -->
			<xsl:text>,Policy,CSB,Status,Annualized,Factor,Low Reserve,High Reserve,Net Premium,One Year&#10;</xsl:text>
			<xsl:text>,Number,No,Code,Gross Premium,Type,Factor Per Unit,Factor Per Unit,Factor Per Unit,Net Premium</xsl:text>

			<xsl:apply-templates select="segmentLines__C/REPT__WJBN__Segment">
				<xsl:with-param name="segType">C</xsl:with-param>
			</xsl:apply-templates>

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(segmentLines__U) > '0'">
			<xsl:text>* * * * U Segments * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<xsl:apply-templates select="detailHeading" />
			
			<!-- ,Policy Number,CSB No,Status Code,Annualized Gross Premium,Account Value,Guaranteed Maturity Premium,Guaranteed Maturity Fund,Net Amount At Risk,Death Benefit Option,Net Premium Per Unit -->
			<xsl:text>,Policy,CSB,Status,Annualized,Account,Guar Maturity,Guar Maturity,Net Amount,Death,Net Premium&#10;</xsl:text>
			<xsl:text>,Number,No,Code,Gross Premium,Value,Premium,Fund,At Risk,Benefit Option,Per Unit</xsl:text>

			<xsl:apply-templates select="segmentLines__U/REPT__WJBN__Segment">
				<xsl:with-param name="segType">U</xsl:with-param>
			</xsl:apply-templates>

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(segmentLines__E) > '0'">
			<xsl:text>* * * * E Segments * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<xsl:apply-templates select="detailHeading" />
			
			<!-- ,Policy Number,CSB No,Status Code,Annualized Premium,Net Contribution,Gross Premium Contribution -->
			<xsl:text>,Policy,CSB,Status,Annualized,Net,Gross Premium&#10;</xsl:text>
			<xsl:text>,Number,No,Code,Premium,Contribution,Contribution</xsl:text>

			<xsl:apply-templates select="segmentLines__E/REPT__WJBN__Segment">
				<xsl:with-param name="segType">E</xsl:with-param>
			</xsl:apply-templates>

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="count(segmentLines__N) > '0'">
			<xsl:text>* * * * N Segments * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<xsl:apply-templates select="detailHeading" />
			
			<!-- ,Policy Number,CSB No,Status Code,Annualized Premium -->
			<xsl:text>,Policy,CSB,Status,Annualized&#10;</xsl:text>
			<xsl:text>,Number,No,Code,Premium</xsl:text>

			<xsl:apply-templates select="segmentLines__N/REPT__WJBN__Segment">
				<xsl:with-param name="segType">N</xsl:with-param>
			</xsl:apply-templates>

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<!-- Totals must exist and would be their own page on the PDF -->
		<xsl:apply-templates select="totals" />
		
	</xsl:template>
	
	<xsl:template match="detailHeading">
		<xsl:text>,Request: </xsl:text><xsl:value-of select="requestNumber" />
		<xsl:text>,Major Line: </xsl:text><xsl:value-of select="majorLine" />
		<xsl:text>,Basis: </xsl:text><xsl:value-of select="basis" />
		<xsl:text>,Coverage Type: </xsl:text><xsl:value-of select="coverageType" />
		<xsl:text>,VPC: </xsl:text><xsl:value-of select="vpc" />
		<xsl:text>,Plan: </xsl:text><xsl:value-of select="planCode" />
		<xsl:text>,Plan Sub: </xsl:text><xsl:value-of select="planCodeSubType" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template match="REPT__WJBN__DetailLine">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverageNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="subCovNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="issueDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="paidToDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="valAge" /><xsl:text>,</xsl:text>
		<xsl:value-of select="interpOption" /><xsl:text>,</xsl:text>
		<xsl:value-of select="currentDuration" /><xsl:text>,</xsl:text>
		<xsl:value-of select="policyCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(numberOfUnits, '########0.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="benType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(benefit, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(totalReserve, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(reserveAdjust, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netPremium, '########0.00')" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="REPT__WJBN__Segment">
		<xsl:param name="segType"></xsl:param>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverageNumber" /><xsl:value-of select="subCovNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="status" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(annualPremium, '########0.00')" /><xsl:text>,</xsl:text>
		
		<xsl:if test="$segType = 'A'">
			<xsl:value-of select="format-number(segment/accountValue, '########0.00')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/surrenderValue, '########0.00')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="segment/projWinnerDate" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/winnerStrmVal, '########0.00')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="segment/winnerStrmNo" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/netDuraCont, '########0.00')" /><xsl:text>,</xsl:text>
		</xsl:if>
		
		<xsl:if test="$segType = 'C'">
			<xsl:value-of select="segment/factorType" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/lowRsvPerUn, '########0.000000')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/highRsvPerUn, '########0.000000')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/netPremPerUn, '########0.000000')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/oneYearNet, '########0.000000')" /><xsl:text>,</xsl:text>
		</xsl:if>
		
		<xsl:if test="$segType = 'U'">
			<xsl:value-of select="format-number(segment/accountValue, '########0.00')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/guarMatrtyPrem, '########0.00')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/guarMatrtyFund, '########0.00')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/netAmtAtRisk, '########0.00')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="segment/deathBenefitOp" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/netPremPerUn, '########0.000000')" /><xsl:text>,</xsl:text>
		</xsl:if>
		
		<xsl:if test="$segType = 'E'">
			<xsl:value-of select="format-number(segment/dtdNetCont, '########0.00')" /><xsl:text>,</xsl:text>
			<xsl:value-of select="format-number(segment/dtdGroCont, '########0.00')" /><xsl:text>,</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="totals">
		<xsl:text>Totals For Basis </xsl:text><xsl:value-of select="basis" />
		<xsl:text> and Request Number </xsl:text><xsl:value-of select="requestNumber" />
		<xsl:text>&#10;</xsl:text>

		<xsl:if test="count(breakTotals) > '0'">
			<xsl:apply-templates select="breakTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

		<xsl:if test="count(keyTotals) > '0'">
			<xsl:apply-templates select="keyTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

		<xsl:if test="count(basisTotals) > '0'">
			<xsl:text>* * * * Request </xsl:text><xsl:value-of select="requestNumber" />
			<xsl:text>  Basis </xsl:text><xsl:value-of select="basis" /><xsl:text> Totals * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
			
			<!-- ,Number of Units,Benefit Type,Benefit Amount,Total Reserve,Net Premium,Policy Count,Piece Count -->
			<xsl:text>,Number,Benefit,Benefit,Total,Net,Policy,Piece&#10;</xsl:text>
			<xsl:text>,of Units,Type,Amount,Reserve,Premium,Count,Count</xsl:text>
		
			<xsl:apply-templates select="basisTotals/WJBN__Totals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="breakTotals">
		<xsl:text>* * * * </xsl:text>
		<xsl:choose>
			<xsl:when test="breakType = '2'">
				<xsl:text>Valuation Age </xsl:text>
			</xsl:when>

			<xsl:when test="breakType = '1'">
				<xsl:text>Duration </xsl:text>
			</xsl:when>

			<xsl:when test="breakType = '0'">
				<xsl:text>Issue Year </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:value-of select="breakField" /><xsl:text> Totals* * * *</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<!-- ,Number of Units,Benefit Type,Benefit Amount,Total Reserve,Net Premium,Policy Count,Piece Count -->
			<xsl:text>,Number,Benefit,Benefit,Total,Net,Policy,Piece&#10;</xsl:text>
			<xsl:text>,of Units,Type,Amount,Reserve,Premium,Count,Count</xsl:text>
		
		<xsl:apply-templates select="lineTotals/WJBN__Totals" />
		
	</xsl:template>
	
	<xsl:template match="keyTotals">
		<xsl:text>* * * * Valuation Key Totals * * * *</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<!-- ,Coverage Type,Major Line,Lives Code,Modify Code,Interest Function,Interest Rate/Code,Mortality Table,Plan Code,Sub Code -->
		<xsl:text>,Coverage,Major,Lives,Modify,Interest,Interest,Mortality,Plan,Sub&#10;</xsl:text>
		<xsl:text>,Type,Line,Code,Code,Function,Rate/Code,Table,Code,Code</xsl:text>
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text><xsl:value-of select="coverageType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="majorLine" /><xsl:text>,</xsl:text>
		<xsl:value-of select="livesCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="modifyCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="interestFunction" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(interestRateCode, '########0.0000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="mortalityTable" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planSub" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<!-- ,Number of Units,Benefit Type,Benefit Amount,Total Reserve,Net Premium,Policy Count,Piece Count -->
		<xsl:text>,Number,Benefit,Benefit,Total,Net,Policy,Piece&#10;</xsl:text>
		<xsl:text>,of Units,Type,Amount,Reserve,Premium,Count,Count</xsl:text>
		
		<xsl:apply-templates select="lineTotals/WJBN__Totals" />
		
	</xsl:template>
	
	<xsl:template match="WJBN__Totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(numUnits, '########0.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="benefitType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(benefitAmount, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(totalReserve, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netPremium, '########0.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="policyCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="pieceCount" />
	</xsl:template>
</xsl:stylesheet>