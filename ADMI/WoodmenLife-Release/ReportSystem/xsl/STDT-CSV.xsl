<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- Support Processing Rules Sections xsl files -->
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-AN-CSV.xsl" />
	<xsl:import href="STDT-AX-CSV.xsl" />
	<xsl:import href="STDT-BT-CSV.xsl" />
	<xsl:import href="STDT-CW-CSV.xsl" />
	<xsl:import href="STDT-GB-CSV.xsl" />
	<xsl:import href="STDT-GR-CSV.xsl" />
	<xsl:import href="STDT-KM-CSV.xsl" />
	<xsl:import href="STDT-LM-CSV.xsl" />
	<xsl:import href="STDT-LN-CSV.xsl" />
	<xsl:import href="STDT-MC-CSV.xsl" />
	<xsl:import href="STDT-MX-CSV.xsl" />
	<xsl:import href="STDT-PX-CSV.xsl" />
	<xsl:import href="STDT-QG-CSV.xsl" />
	<xsl:import href="STDT-QP-CSV.xsl" />
	<xsl:import href="STDT-SD-CSV.xsl" />
	<xsl:import href="STDT-SO-CSV.xsl" />
	<xsl:import href="STDT-TM-CSV.xsl" />
	<xsl:output method="text" />
	<xsl:template match="/">
        <xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract"><xsl:call-template name="mainHeader1"/>
	    <!-- Support Processing Rules Sections select and call-template -->
        <xsl:for-each select="reportExtractSet/PFAN__MasterArea"> 
	    	<xsl:call-template name="plan" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFAX__MasterArea"> 
	    	<xsl:call-template name="plax" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFBT__MasterArea"> 
	    	<xsl:call-template name="plbt" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFCW__MasterArea"> 
	    	<xsl:call-template name="plcw" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFGB__MasterArea"> 
	    	<xsl:call-template name="plgb" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFGR__MasterArea"> 
	    	<xsl:call-template name="plgr" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFKM__MasterArea"> 
	    	<xsl:call-template name="plkm" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFLM__MasterArea"> 
	    	<xsl:call-template name="pllm" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFLN__MasterArea"> 
	    	<xsl:call-template name="plln" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFMC__MasterArea"> 
	    	<xsl:call-template name="plmc" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFMX__MasterArea"> 
	    	<xsl:call-template name="plmx" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFPX__MasterArea"> 
	    	<xsl:call-template name="plpx" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFQG__MasterArea"> 
	    	<xsl:call-template name="plqg" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFQP__MasterArea"> 
	    	<xsl:call-template name="plqp" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFSD__MasterArea"> 
	    	<xsl:call-template name="plsd" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFSO__MasterArea"> 
	    	<xsl:call-template name="plso" />
	    </xsl:for-each>
        <xsl:for-each select="reportExtractSet/PFTM__MasterArea"> 
	    	<xsl:call-template name="pltm" />
	    </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>