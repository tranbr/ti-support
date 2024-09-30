<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support WJDN CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>
  	
  	<xsl:template match="XML__ReportExtract">  	
		<xsl:apply-templates select="reportExtractSet/REPT__WJDN__Extract" />
	</xsl:template>
  	
	<xsl:template match="REPT__WJDN__Extract">
		<!-- - - - - - - - - - - - - - - - - - - --->
		<!-- Start by printing the report heading -->
		<!-- - - - - - - - - - - - - - - - - - - --->
		
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
		
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
		<!-- We potentially have three different types of data to display. -->
		<!--      Detail Records  (see APVWBP00.modifier.charAt(5))        -->
		<!--      Segment Records (see APVWBP00.modifier.charAt(6))        -->
		<!--      Totals                                                   -->
		<!-- At a minimum, we have Totals to print.                        -->
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
		
		<xsl:if test="detailLines != null">
			<!-- - - - - - - - - - - - - - - - - - - - - - - - - -->
			<!-- Detail Lines would be their own page on the PDF -->
			<!-- - - - - - - - - - - - - - - - - - - - - - - - - -->
			
			<xsl:apply-templates select="detailHeading" />

			<xsl:text>,Policy Number,Coverage Number,Sub Coverage,Issue Date,Issue Age,ABC Rule,ABC Modifier,</xsl:text>
			<xsl:value-of select="field1" /><xsl:text>,</xsl:text>
			<xsl:value-of select="field2" /><xsl:text>,</xsl:text>
			<xsl:text>Number of Units,Current Duration</xsl:text>

			<xsl:apply-templates select="detailLines/REPT__WJDN__DetailLine" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --->
		<!-- Each type of segment would be its own page on the PDF, if they exist -->
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --->
		
		<xsl:if test="segmentLines__C != null">
			<xsl:text>C Segments</xsl:text>
			<xsl:text>&#10;</xsl:text>
			
			<xsl:apply-templates select="detailHeading" />
			
			<xsl:text>,Policy Number,Coverage Number,Sub Coverage,Factor Type,Low Reserve Factor Per Unit,High Reserve Factor Per Unit,Net Premium Factor Per Unit</xsl:text>

			<xsl:apply-templates select="segmentLines__C/REPT__WJDN__Segment" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="segmentLines__F != null">
			<xsl:text>F Segments</xsl:text>
			<xsl:text>&#10;</xsl:text>
			
			<xsl:apply-templates select="detailHeading" />
			
			<xsl:text>,Policy Number,Coverage Number,Sub Coverage,Tax Winner Type,Winner Rate or Table,Low Cash Value Per Unit,High Cash Value Per Unit, Nonforfeiture Premium Per Unit</xsl:text>

			<xsl:apply-templates select="segmentLines__F/REPT__WJDN__Segment" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="segmentLines__O != null">
			<xsl:text>O Segments</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<xsl:apply-templates select="detailHeading" />
			
			<xsl:text>,Policy Number,Coverage Number,Sub Coverage,Tax Winner Type,Winner Rate or Table</xsl:text>

			<xsl:apply-templates select="segmentLines__O/REPT__WJDN__Segment" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="segmentLines__R != null">
			<xsl:text>R Segments</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<xsl:apply-templates select="detailHeading" />
			
			<xsl:text>,Policy Number,Coverage Number,Sub Coverage,Deficiency Reserve,Total Net Premium,Gross Premium,Annuity Factor,Minimum Stand Reserve</xsl:text>

			<xsl:apply-templates select="segmentLines__R/REPT__WJDN__Segment" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="segmentLines__D != null">
			<xsl:text>D Segments</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<xsl:apply-templates select="detailHeading" />
			
			<xsl:text>,Policy Number,Coverage Number,Sub Coverage,Disability Reserve,Term Reserve,Reserve Code,Term Reserve Code,Claim Number,Disability Factor,Term Factor,Expire Date,Waived Amount</xsl:text>

			<xsl:apply-templates select="segmentLines__D/REPT__WJDN__Segment" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="segmentLines__G != null">
			<xsl:text>G Segments</xsl:text>
			<xsl:text>&#10;</xsl:text>
		
			<xsl:apply-templates select="detailHeading" />
			
			<xsl:text>,Policy Number,Via Drop,Asset Decrease,Residual Amount,Payment Value,Last Dur AALR,Current AALR,One Year Term Reserve</xsl:text>

			<xsl:apply-templates select="segmentLines__G/REPT__WJDN__Segment" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - --->
		<!-- Totals must exist and would be their own page on the PDF -->
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - --->
		<xsl:apply-templates select="totals" />
		
	</xsl:template>
	
	<xsl:template match="detailHeading">
		<xsl:text>Request:,</xsl:text><xsl:value-of select="requestNumber" /><xsl:text>,</xsl:text>
		<xsl:text>ABC Code:,</xsl:text><xsl:value-of select="abcCode" /><xsl:text>,</xsl:text>
		<xsl:text>Basis:,</xsl:text><xsl:value-of select="basis" /><xsl:text>,</xsl:text>
		<xsl:text>Coverage Type:,</xsl:text><xsl:value-of select="coverageType" /><xsl:text>,</xsl:text>
		<xsl:text>VPC:,</xsl:text><xsl:value-of select="vpc" /><xsl:text>,</xsl:text>
		<xsl:text>Plan:,</xsl:text><xsl:value-of select="planCode" /><xsl:text>,</xsl:text>
		<xsl:text>Plan Sub:,</xsl:text><xsl:value-of select="planCodeSubType" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template match="REPT__WJDN__DetailLine">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverageNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="subCovNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="issueDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="issueAge" /><xsl:text>,</xsl:text>
		<xsl:value-of select="abcRule" /><xsl:text>,</xsl:text>
		<xsl:value-of select="abcModifier" /><xsl:text>,</xsl:text>
		<xsl:value-of select="abcField1" /><xsl:text>,</xsl:text>
		<xsl:value-of select="abcField2" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(numberOfUnits, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="currentDuration" />
	</xsl:template>
	
	<xsl:template match="REPT__WJDN__Segment">
		<xsl:if test="segment != null">
			<xsl:text>&#10;</xsl:text>
			<xsl:text>,</xsl:text>
			
			<xsl:choose>
				<xsl:when test="segment/TRJD__Segment__G">
					<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
				</xsl:when>
				
				<xsl:otherwise>
					<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
					<xsl:value-of select="coverageNumber" /><xsl:text>,</xsl:text>
					<xsl:value-of select="subCovNumber" /><xsl:text>,</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			
			<xsl:choose>
				<xsl:when test="segment/TRJD__Segment__C">
					<xsl:apply-templates select="segment/TRJD__Segment__C" />
				</xsl:when>

				<xsl:when test="segment/TRJD__Segment__F">
					<xsl:apply-templates select="segment/TRJD__Segment__F" />
				</xsl:when>

				<xsl:when test="segment/TRJD__Segment__O">
					<xsl:apply-templates select="segment/TRJD__Segment__O" />
				</xsl:when>
			
				<xsl:when test="segment/TRJD__Segment__R">
					<xsl:apply-templates select="segment/TRJD__Segment__R" />
				</xsl:when>
				
				<xsl:when test="segment/TRJD__Segment__D">
					<xsl:apply-templates select="segment/TRJD__Segment__D" />
				</xsl:when>
				
				<xsl:when test="segment/TRJD__Segment__G">
					<xsl:apply-templates select="segment/TRJD__Segment__G" />
				</xsl:when>
			</xsl:choose>
			
			<xsl:text>&#10;</xsl:text> <!-- Move to the next line for the next segment -->
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="TRJD__Segment__C">
		<xsl:value-of select="factorType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(lowRsvPerUn, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(highRsvPerUn, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netPremPerUn, '###,###,###.000000')" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="TRJD__Segment__F">
		<xsl:value-of select="txWinnerType" /><xsl:text>,</xsl:text>
		
		<xsl:choose>
			<xsl:when test="interUseCode = '0' or interUseCode = '2'">
				<xsl:value-of select="format-number(interRate, '###,###,###.0000')" /><xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="interTable" /><xsl:text>,</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:value-of select="format-number(lowCvPerUnit, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(highCvPerUnit, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(nonforfeitPu, '###,###,###.000000')" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="TRJD__Segment__O">
		<xsl:value-of select="txWinnerType" /><xsl:text>,</xsl:text>
		
		<xsl:choose>
			<xsl:when test="interUseCode = '0' or interUseCode = '2'">
				<xsl:value-of select="format-number(interRate, '###,###,###.0000')" /><xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="interTable" /><xsl:text>,</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="TRJD__Segment__R">
		<xsl:value-of select="format-number(defRsrv, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(totNetPrem, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(annPrem, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(antyFactor, '###,###,###.0000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(minStRsrv, '###,###,###.00')" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="TRJD__Segment__D">
		<xsl:value-of select="format-number(rsvrDisPerUn, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(rsvrTermPerUn, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="reserveCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="termRsvrCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="claimNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(disFactor, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(termFactor, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="disExpireDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(waivedAmount, '###,###,###.00')" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="TRJD__Segment__G">
		<xsl:value-of select="format-number(dropVia, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(assetDrop, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(residual, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(tpx, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(lastAALR, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(currAALR, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(oytRes, '###,###,###.00')" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="totals">
		<xsl:text>Totals For Basis </xsl:text><xsl:value-of select="basis" />
		<xsl:text> and Request Number </xsl:text><xsl:value-of select="requestNumber" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:if test="breakTotals != null">
			<xsl:apply-templates select="breakTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

		<xsl:if test="keyTotals != null">
			<xsl:apply-templates select="keyTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

		<xsl:if test="basisTotals != null">
			<xsl:text>* * * * Request/Basis Totals * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>Request Number,Basis Type</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="requestNumber" /><xsl:text>,</xsl:text><xsl:value-of select="basis" />
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>,</xsl:text><xsl:value-of select="//field1" />
			<xsl:text>,Piece Count</xsl:text>
		
			<xsl:apply-templates select="basisTotals/WJDN__Totals" />
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
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text><xsl:value-of select="//field1" />
		<xsl:text>,Piece Count</xsl:text>
		
		<xsl:apply-templates select="totals/WJDN__Totals" />
		
	</xsl:template>
	
	<xsl:template match="keyTotals">
		<xsl:text>* * * * Valuation Key Totals * * * *</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,Coverage Type,ABC Code,Lives Code,Modify Code,Interest Function,Interest Rate/Code,Mortality Table,Plan Code,Sub Code</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text><xsl:value-of select="coverageType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="abcCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="livesCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="modifyCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="interestFunction" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(interestRateCode, '###,###,###.0000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="mortalityTable" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planSub" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text><xsl:value-of select="//field1" />
		<xsl:text>,Piece Count</xsl:text>
		
		<xsl:apply-templates select="totals/WJDN__Totals" />
		
	</xsl:template>
	
	<xsl:template match="WJDN__Totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(abcValue, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="pieceCount" />
	</xsl:template>
</xsl:stylesheet>