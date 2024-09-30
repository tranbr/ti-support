<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <!-- 5/21/20 [cabrma]: While the code here is identical to ADMI-UTILS.xsl,
         the output method needs to be "xml" to be processed by ESTB-PDF.xsl. -->
    <xsl:output method="xml" indent="yes" />

    <!-- Support graphics variables
         These values must be set before installation at a customer site -->
    <xsl:variable name="GRAPHICS-FOLDER" select="'../grx/'" />
    <xsl:variable name="LOGO-FILENAME" select="'companyLogo.jpg'" />
    <!-- Height and width are given in inches.
         Example based on a 964x689 (pixels) image, and 2in maximum width.
         689/1000 x 2 = 1.37in height
         964/1000 x 2 = 1.92in width -->
    <xsl:variable name="LOGO-HEIGHT" select="'1.37in'" />
    <xsl:variable name="LOGO-WIDTH" select="'1.92in'" />
    <xsl:variable name="SIGNATURE-FILENAME" select="'signature.png'" />
    <!-- Height and width are given in inches.
         Example based on a 200x55 (pixels) image, and 2in maximum width. -->
    <xsl:variable name="SIGNATURE-HEIGHT" select="'.55in'" />
    <xsl:variable name="SIGNATURE-WIDTH" select="'2in'" />

    <!-- Support font variables
         These values must be set before installation at a customer site.
         Replace the text "FontNameHere" with your MICR font name. -->
    <xsl:variable name="MICR-FONT" select="'FontNameHere'" />

    <!--  Support Utilities for General ADMI XSL Process -->
    <xsl:template match="*/text()[not(normalize-space())]"  />
</xsl:stylesheet>