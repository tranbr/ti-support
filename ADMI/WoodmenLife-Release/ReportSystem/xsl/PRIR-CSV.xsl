<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support PRIR CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	

	<xsl:template match="XML__ReportExtract">  
	    <xsl:text>"Company Code:" </xsl:text><xsl:value-of select="./companyCode" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Company Name:" </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./companyName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report Description: " </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./reportDescription" /><xsl:text>,</xsl:text><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report ID:" </xsl:text><xsl:value-of select="./reportID" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="fromMonth" select="substring(./fromDate, 6, 2)"/>
		<xsl:variable name="fromDay" select="substring(./fromDate, 9)"/>
		<xsl:variable name="fromYear" select="substring(./fromDate, 1, 4)"/>
		<xsl:variable name="fromDate" select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" />
		<xsl:text>"From Date:" </xsl:text><xsl:value-of select="$fromDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="thruMonth" select="substring(./thruDate, 6, 2)"/>
		<xsl:variable name="thruDay" select="substring(./thruDate, 9)"/>
		<xsl:variable name="thruYear" select="substring(./thruDate, 1, 4)"/>
		<xsl:variable name="thruDate" select="concat($thruMonth, '-', $thruDay, '-', $thruYear)" />
		<xsl:text>"Thru Date:" </xsl:text><xsl:value-of select="$thruDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="reportMonth" select="substring(./reportDate, 6, 2)"/>
		<xsl:variable name="reportDay" select="substring(./reportDate, 9)"/>
		<xsl:variable name="reportYear" select="substring(./reportDate, 1, 4)"/>
		<xsl:variable name="reportDate" select="concat($reportMonth, '-', $reportDay, '-', $reportYear)" />
		<xsl:text>"Report Date:" </xsl:text><xsl:value-of select="$reportDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>"Report Time:" </xsl:text><xsl:value-of select="./reportTime" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Printed By:" </xsl:text><xsl:value-of select="./printedBy" /><xsl:text>,</xsl:text>	
		<xsl:text>&#10;</xsl:text>	
		<xsl:text>&#10;</xsl:text>	
		<xsl:apply-templates select="reportExtractSet" />
		</xsl:template>
	
	<xsl:template match="reportExtractSet">
  	    <xsl:text>&#10;</xsl:text>
  	    <xsl:text>&#10;</xsl:text>
		<xsl:text>Company Code,</xsl:text>
		<xsl:text>Policy Number,</xsl:text>
		<xsl:text>Insured Name,</xsl:text>
		<xsl:text>Death Benefit,</xsl:text>
		<xsl:text>Face Amount,</xsl:text>
		<xsl:text>Issue Date,</xsl:text>
		<xsl:text>Issue Age,</xsl:text>
		<xsl:text>Issue State,</xsl:text>
		<xsl:text>Planned Premium,</xsl:text>
		<xsl:text>Billing Mode,</xsl:text>
		<xsl:text>Paid To Date,</xsl:text>
		<xsl:text>Department Desk,</xsl:text>
		<xsl:text>Backout/Reapply Indicator,</xsl:text>
		<xsl:text>Reinsurance Indicator,</xsl:text>
		<xsl:text>Control Info,</xsl:text>
		<xsl:text>Previous Journal Date,</xsl:text>
		<xsl:text>Tran Code,</xsl:text>
		<xsl:text>Field Description,</xsl:text>
		<xsl:text>Data Type,</xsl:text>
		<xsl:text>Change Data</xsl:text><xsl:text>&#10;</xsl:text>
	   	<xsl:for-each select="PMBM__CompareSegmentExt/entrySet/PMBM__CompareSegmentEntry"> 
		   <xsl:call-template name="detail_line"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="detail_line">  
    	<xsl:if test="count(preceding-sibling::PMBM__CompareSegmentEntry) = 0">
	    	<xsl:text>"</xsl:text>
			<xsl:value-of select="../../companyCode" />
			<xsl:text>"</xsl:text>
		</xsl:if>
		<xsl:if test="count(preceding-sibling::PMBM__CompareSegmentEntry) > 0">
			<xsl:text>""</xsl:text>
		</xsl:if>
		<xsl:text>,</xsl:text>
    	<xsl:if test="count(preceding-sibling::PMBM__CompareSegmentEntry) = 0">
			<xsl:text>"</xsl:text>
			<xsl:value-of select="../../policyNumber" />
			<xsl:text>"</xsl:text>
		</xsl:if>
		<xsl:if test="count(preceding-sibling::PMBM__CompareSegmentEntry) > 0">
			<xsl:text>""</xsl:text>
		</xsl:if>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../insuredName" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../deathBenefit" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../faceAmount" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="issueMonth" select="substring(../../issueDate, 6, 2)"/>
		<xsl:variable name="issueDay" select="substring(../../issueDate, 9)"/>
		<xsl:variable name="issueYear" select="substring(../../issueDate, 1, 4)"/>
		<xsl:variable name="issueDate" select="concat($issueMonth, '-', $issueDay, '-', $issueYear)" />
		<xsl:value-of select="$issueDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../issueAge" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../issueState" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../plannedPremium" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../billingMode" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="procMonth" select="substring(../../processedThruDate, 6, 2)"/>
		<xsl:variable name="procDay" select="substring(../../processedThruDate, 9)"/>
		<xsl:variable name="procYear" select="substring(../../processedThruDate, 1, 4)"/>
		<xsl:variable name="procDate" select="concat($procMonth, '-', $procDay, '-', $procYear)" />
		<xsl:value-of select="$procDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../departmentDesk" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../backoutReapplyInd" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="../../reinsuranceInd" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="controlInfo" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="journalMonth" select="substring(../../journalDate, 6, 2)"/>
		<xsl:variable name="journalDay" select="substring(../../journalDate, 9)"/>
		<xsl:variable name="journalYear" select="substring(../../journalDate, 1, 4)"/>
		<xsl:variable name="journalDate" select="concat($journalMonth, '-', $journalDay, '-', $journalYear)" />
		<xsl:value-of select="$journalDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="tranCode" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="fieldDescription" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="dataType" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="changeData" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
</xsl:stylesheet>