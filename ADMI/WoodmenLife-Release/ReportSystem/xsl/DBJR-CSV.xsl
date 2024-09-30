<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="BILL-REG-CSV-UTILS.xsl" />
	<xsl:output method="text" />
	<xsl:template match="/">  
		<xsl:call-template name="process"/>
	</xsl:template>
</xsl:stylesheet>