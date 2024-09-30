<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support VB Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFVB__MasterArea"> 
		   <xsl:call-template name="plvb"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plvb">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>
		<xsl:text>Incoming Allocation Use,</xsl:text>	
		<xsl:text>Incoming Allocation Minimum,</xsl:text>	
		<xsl:text>Incoming Allocation Maximum,</xsl:text>
		<xsl:text>Incoming Allocation Priority,</xsl:text>
		<xsl:text>Incoming Default Use,</xsl:text>
		<xsl:text>Incoming Default Amount/Percent,</xsl:text>
		<xsl:text>Deduction Allocation Use,</xsl:text>
		<xsl:text>Deduction Allocation Minimum,</xsl:text>
		<xsl:text>Deduction Allocation Maximum,</xsl:text>
		<xsl:text>Deduction Allocation Priority,</xsl:text>
		<xsl:text>Deduction Default Use,</xsl:text>
		<xsl:text>Deduction Default Amount/Percent,</xsl:text>
		<xsl:text>Issue State,</xsl:text>
		<xsl:text>State Use,</xsl:text>
		<xsl:text>LIFO/FIFO Deduction Rule,</xsl:text>
		<xsl:text>Minimum Value Share Use,</xsl:text>
		<xsl:text>Minimum Value Shares,</xsl:text>
		<xsl:text>Loanable Percent,</xsl:text>
		<xsl:text>Account ID,</xsl:text>
		<xsl:text>Account Type,</xsl:text>
		<xsl:text>Minimum Deposit Use,</xsl:text>
		<xsl:text>Minimum Deposit Amount,</xsl:text>
		<xsl:text>Attained Age,</xsl:text>
		<xsl:text>Segregate New Money,</xsl:text>
		<xsl:text>Free-Look Days Application,</xsl:text>
		<xsl:text>Free-Look Days Activation,</xsl:text>
		<xsl:text>Replication Indicator</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__IN__ALLOC__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__IN__ALLOC__MIN__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__IN__ALLOC__MAX__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__IN__DFLT__PRIOR__NUMB" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__IN__DFLT__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__IN__DFLT__AMT__PCT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DDUCT__ALLOC__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DED__ALLOC__MIN__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DED__ALLOC__MAX__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DED__DFLT__PRIOR__NUM" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DDUCT__DFLT__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DDUCT__DFLT__AMT__PCT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ISSUE__STATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ISSUE__STATE__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LIFO__FIFO__DED__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__VALUE__SHARE__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MINIMUM__VAL__SHRS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LOANABLE__PERCENT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCOUNT__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCOUNT__TYPE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MIN__DEPOSIT__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MIN__DEPOSIT__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ATTAINED__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SEG__NEW__MONEY" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FREE__LOOK__DAY__APPL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FREE__LOOK__DAY__ACTV" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__REPLICATION__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
		<xsl:text>&#10;</xsl:text>  		
    </xsl:template>		
</xsl:stylesheet>