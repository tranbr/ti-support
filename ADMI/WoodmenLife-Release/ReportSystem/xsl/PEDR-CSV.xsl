<?xml version="1.0" encoding="UTF-8"?>
<?mso-application progid="Excel.Sheet"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="text" />
    <!-- Support PEDR CSV XSL Transformation Process -->
    <xsl:template match="/">
        <xsl:apply-templates select="XML__ReportExtract"/>
        <xsl:apply-templates select="XML__ReportExtract/totals"/>
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
    </xsl:template>
    <xsl:template match="totals">
        <xsl:text>"Access"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Policy"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Coverage Number"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Subcoverage Number"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Transaction ID"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Plan"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Issue Age"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"True Age"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Effective Date"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"State"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Status"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Face Amount"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Record Type"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"On PE Code"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Off PE Code"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Death Benefit Option"</xsl:text><xsl:text>&#10;</xsl:text>

        <xsl:for-each select="totalEntrySet/XML__PEDR__TotalEntry">
            <xsl:value-of select="access" /><xsl:text>,</xsl:text>
            <xsl:value-of select="policy" /><xsl:text>,</xsl:text>
            <xsl:value-of select="coverageNumber" /><xsl:text>,</xsl:text>
            <xsl:value-of select="subCoverageNumber" /><xsl:text>,</xsl:text>
            <xsl:value-of select="tranID" /><xsl:text>,</xsl:text>
            <xsl:value-of select="plan" /><xsl:text>,</xsl:text>
            <xsl:value-of select="issueAge" /><xsl:text>,</xsl:text>
            <xsl:value-of select="trueAge" /><xsl:text>,</xsl:text>
            <xsl:value-of select="effectiveDate" /><xsl:text>,</xsl:text>
            <xsl:value-of select="state" /><xsl:text>,</xsl:text>
            <xsl:value-of select="status" /><xsl:text>,</xsl:text>
            <xsl:value-of select="face" /><xsl:text>,</xsl:text>
            <xsl:value-of select="recordType" /><xsl:text>,</xsl:text>
            <xsl:value-of select="onPeCode" /><xsl:text>,</xsl:text>
            <xsl:value-of select="offPeCode" /><xsl:text>,</xsl:text>
            <xsl:value-of select="deathBenefitOption" /><xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>