<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <!-- Support FVDD CSV XSL Transformation Process -->

    <xsl:template match="/">
        <xsl:apply-templates select="XML__ReportExtract"/>
    </xsl:template>

    <xsl:template match="XML__ReportExtract">
        <xsl:apply-templates select="reportExtractSet/REPT__SuspenseItems__Extract"/>
    </xsl:template>

    <xsl:template match="REPT__SuspenseItems__Extract">
        <!-- Start by printing the report heading -->

        <xsl:text>CO. </xsl:text><xsl:value-of select="//companyCode"/><xsl:text> REPORT </xsl:text><xsl:value-of select="//reportID"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:value-of select="heading1"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:variable name="from_Month" select="substring(//fromDate, 6, 2)"/>
        <xsl:variable name="from_Day" select="substring(//fromDate, 9)"/>
        <xsl:variable name="from_Year" select="substring(//fromDate, 1, 4)"/>
        <xsl:variable name="from_Date" select="concat($from_Month, '-', $from_Day, '-', $from_Year)"/>
        <xsl:text>From </xsl:text><xsl:value-of select="$from_Date"/>
        <xsl:variable name="thru_Month" select="substring(//thruDate, 6, 2)"/>
        <xsl:variable name="thru_Day" select="substring(//thruDate, 9)"/>
        <xsl:variable name="thru_Year" select="substring(//thruDate, 1, 4)"/>
        <xsl:variable name="thru_Date" select="concat($thru_Month, '-', $thru_Day, '-', $thru_Year)"/>
        <xsl:text> Thru </xsl:text><xsl:value-of select="$thru_Date"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:variable name="rept_Month" select="substring(//reportDate, 6, 2)"/>
        <xsl:variable name="rept_Day" select="substring(//reportDate, 9)"/>
        <xsl:variable name="rept_Year" select="substring(//reportDate, 1, 4)"/>
        <xsl:variable name="rept_Date" select="concat($rept_Month, '-', $rept_Day, '-', $rept_Year)"/>
        <xsl:text>Date </xsl:text><xsl:value-of select="$rept_Date"/>
        <xsl:text> Time </xsl:text><xsl:value-of select="//reportTime"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:value-of select="heading2"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Printed By: </xsl:text><xsl:value-of select="//printedBy"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>

        <xsl:if test="count(detailLines) > '0'">

            <xsl:text>,Policy,Account ID, Description of Item, Debit Amount, Credit Amount, Line of Business  &#10;</xsl:text>

            <xsl:apply-templates select="detailLines/REPT__SuspenseItems__DetailLine"/>

            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="REPT__SuspenseItems__DetailLine">
        <xsl:text>&#10;</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="policyNumber"/><xsl:text>,</xsl:text>
        <xsl:value-of select="accountID"/><xsl:text>,</xsl:text>
        <xsl:value-of select="descriptionOfItem"/><xsl:text>,</xsl:text>
        <xsl:value-of select="format-number(debitAmount, '########0.00')"/><xsl:text>,</xsl:text>
        <xsl:value-of select="format-number(creditAmount, '########0.00')"/><xsl:text>,</xsl:text>
        <xsl:value-of select="lineOfBusiness"/><xsl:text></xsl:text>
    </xsl:template>
</xsl:stylesheet>