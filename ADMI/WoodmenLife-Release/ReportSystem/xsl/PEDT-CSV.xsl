<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- Support Product Rules Sections xsl files -->
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-AA-CSV.xsl" />
	<xsl:import href="PEDT-AE-CSV.xsl" />
	<xsl:import href="PEDT-BE-CSV.xsl" />
	<xsl:import href="PEDT-BX-CSV.xsl" />
	<xsl:import href="PEDT-CA-CSV.xsl" />
	<xsl:import href="PEDT-CB-CSV.xsl" />
	<xsl:import href="PEDT-CP-CSV.xsl" />
	<xsl:import href="PEDT-DD-CSV.xsl" />
	<xsl:import href="PEDT-FA-CSV.xsl" />
	<xsl:import href="PEDT-HD-CSV.xsl" />
	<xsl:import href="PEDT-PT-CSV.xsl" />
	<xsl:import href="PEDT-RO-CSV.xsl" />
	<xsl:import href="PEDT-SW-CSV.xsl" />
	<xsl:import href="PEDT-UE-CSV.xsl" />
	<xsl:import href="PEDT-VB-CSV.xsl" />
	<xsl:import href="PEDT-WP-CSV.xsl" />
	<xsl:import href="PEDT-YF-CSV.xsl" />
	<xsl:output method="text" />
	<xsl:template match="/">
        <xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract"><xsl:call-template name="mainHeader1"/>
	    <!-- Support Processing Rules Sections select and call-template -->
        <xsl:for-each select="reportExtractSet/PFAA__MasterArea"> 
	    <xsl:call-template name="plaa" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFAE__MasterArea"> 
	       <xsl:call-template name="plae" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFBE__MasterArea"> 
	       <xsl:call-template name="plbe" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFBX__MasterArea"> 
	       <xsl:call-template name="plbx" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFCA__MasterArea"> 
	       <xsl:call-template name="plca" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFCB__MasterArea"> 
	       <xsl:call-template name="plcb" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFCP__MasterArea"> 
	       <xsl:call-template name="plcp" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFDD__MasterArea"> 
	       <xsl:call-template name="pldd" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFFA__MasterArea"> 
	       <xsl:call-template name="plfa" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFHD__MasterArea"> 
	       <xsl:call-template name="plhd" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFPT__MasterArea"> 
	       <xsl:call-template name="plpt" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFRO__MasterArea"> 
	       <xsl:call-template name="plro" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFSW__MasterArea"> 
	       <xsl:call-template name="plsw" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFUE__MasterArea"> 
	       <xsl:call-template name="plue" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFVB__MasterArea"> 
	       <xsl:call-template name="plvb" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFWP__MasterArea"> 
	       <xsl:call-template name="plwp" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFYF__MasterArea"> 
	       <xsl:call-template name="plyf" />
	    </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>