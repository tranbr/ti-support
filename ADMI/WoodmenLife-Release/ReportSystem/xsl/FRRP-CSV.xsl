<?xml version="1.0" encoding="UTF-8"?>
<?mso-application progid="Excel.Sheet"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <!-- Support FVSU CSV XSL Transformation Process -->

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
        <xsl:text>Cash Value,Face Amount,Extra Charges,Waiver COI,ADB COI,Child COI,Spouse COI,Cola COI,GPO COI,Waiver Amount,ADB Units,Guar Waiver COI,Guar AdbCOI,Surrender Value,Monthly Deduction,Death Benefit Option,Par Type,primaryDividendOption,secondaryDividendOption,sexCode,underwriterCode,issueAge,issueMonth,issueYear,planCode,companyCode,policyNumber,ratingTable,stateCode,birthdate,processDate,inactiveProcessedDate,inactiveEffectiveDate,policyStatus &#10;</xsl:text>

        <xsl:for-each select="totalEntrySet/XML__FRRP__TotalEntry">
            <xsl:value-of select="format-number(cashValue, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(faceAmount, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(extraCharges, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(waiverCOI, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(adbCOI, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(childCOI, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(spouseCOI, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(colaCOI, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(gpoCOI, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(waiverAmount, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(adbUnits, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(guarWaiverCOI, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(guarAdbCOI, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(surrenderValue, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="format-number(monthlyDeduction, '########0.00')"/><xsl:text>,</xsl:text>
            <xsl:value-of select="deathBenefitOption"/><xsl:text>,</xsl:text>
            <xsl:value-of select="parType"/><xsl:text>,</xsl:text>
            <xsl:value-of select="primaryDividendOption"/><xsl:text>,</xsl:text>
            <xsl:value-of select="secondaryDividendOption"/><xsl:text>,</xsl:text>
            <xsl:value-of select="sexCode"/><xsl:text>,</xsl:text>
            <xsl:value-of select="underwriterCode"/><xsl:text>,</xsl:text>
            <xsl:value-of select="issueAge"/><xsl:text>,</xsl:text>
            <xsl:value-of select="issueMonth"/><xsl:text>,</xsl:text>
            <xsl:value-of select="issueYear"/><xsl:text>,</xsl:text>
            <xsl:value-of select="planCode"/><xsl:text>,</xsl:text>
            <xsl:value-of select="companyCode"/><xsl:text>,</xsl:text>
            <xsl:value-of select="policyNumber"/><xsl:text>,</xsl:text>
            <xsl:value-of select="ratingTable"/><xsl:text>,</xsl:text>
            <xsl:value-of select="stateCode"/><xsl:text>,</xsl:text>
            <xsl:value-of select="birthdate"/><xsl:text>,</xsl:text>
            <xsl:value-of select="processDate"/><xsl:text>,</xsl:text>
            <xsl:value-of select="inactiveProcessedDate"/><xsl:text>,</xsl:text>
            <xsl:value-of select="inactiveEffectiveDate"/><xsl:text>,</xsl:text>
            <xsl:value-of select="policyStatus"/><xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>