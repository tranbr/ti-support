<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="XML__ReportExtract">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="each"
					page-height="11in" page-width="8.5in" margin-top="0.25in"
					margin-bottom="0.1in" margin-left=".2in" margin-right=".2in">
					<fo:region-body margin-top=".65in" margin-bottom=".1in" />
					<fo:region-before extent="5.2in" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<xsl:apply-templates select="reportExtractSet" />
		</fo:root>
	</xsl:template>


	<xsl:template match="reportExtractSet">
		<xsl:apply-templates
			select="com.lidp.model.admin.persistence.REPT__DLRQ__Extract" />
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__DLRQ__Extract">
		<fo:page-sequence master-reference="each">
			<fo:flow flow-name="xsl-region-body">
				<fo:table width="100%">
					<fo:table-column column-width="50%" />
					<fo:table-column column-width="50%" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:variable name="imagePath"
										select="concat($GRAPHICS-FOLDER, $LOGO-FILENAME)" />
									<fo:external-graphic content-height="scale-to-fit"
										scaling="non-uniform">
										<xsl:attribute name="src">
									 		<xsl:value-of select="$imagePath" />
									 	</xsl:attribute>
										<xsl:attribute name="height">
									 		<xsl:value-of select="$LOGO-HEIGHT" />
									 	</xsl:attribute>
										<xsl:attribute name="content-width">
									 		<xsl:value-of select="$LOGO-WIDTH" />
									 	</xsl:attribute>
									</fo:external-graphic>
								</fo:block>
							</fo:table-cell>

							<fo:table-cell>
								<fo:block text-align="left" font-size="14pt"
									font-family="sans-serif" font-weight="bold">
									<!-- <xsl:value-of select="../../reportDescription" /> -->
									<xsl:text>Delivery Requirements Form</xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt"
									font-family="sans-serif">
									<xsl:text>From: </xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:value-of select="../../companyName" />
								</fo:block>
							</fo:table-cell>

							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt"
									font-family="sans-serif">
									<xsl:text>Date: </xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="month"
										select="substring(../../reportDate, 6, 2)" />
									<xsl:variable name="day"
										select="substring(../../reportDate, 9)" />
									<xsl:variable name="year"
										select="substring(../../reportDate, 1, 4)" />
									<xsl:variable name="date"
										select="concat($month, '-', $day, '-', $year)" />
									<xsl:value-of select="$date" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
								<xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:text>1234 Hobson Road</xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
								<xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:text>Woodridge, IL 60517</xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block>
									<xsl:text />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>To: </xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:value-of select="agentName" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block>
									<xsl:text />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:value-of select="agentAddressSet" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block>
									<xsl:text />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
								<xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:text>Agent Number: </xsl:text>
									<xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:value-of select="agentNumber" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

					<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>

				<fo:table width="100%">
					<fo:table-column column-width="33%" />
					<fo:table-column column-width="34%" />
					<fo:table-column column-width="33%" />
					<fo:table-body>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Pending Policy Number: </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:value-of select="policyNumber" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Payor Information: </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:value-of select="payorName" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:value-of select="payorAddressSet" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Insured Information: </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:value-of select="insuredName" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:value-of select="insuredAddressSet" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Pending Requirements:</xsl:text>    <!--How is this section populated, check apdlrq00! -->
									<xsl:value-of select="DLRQ_DescriptionEntry" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row><fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row><fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Due Date: </xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="dueMonth" select="substring(dueDate, 6, 2)" />
									<xsl:variable name="dueDay" select="substring(dueDate, 9)" />
									<xsl:variable name="dueYear" select="substring(dueDate, 1, 4)" />
									<xsl:variable name="dueDate"
										select="concat($dueMonth, '-', $dueDay, '-', $dueYear)" />
									<xsl:value-of select="$dueDate" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Billing Mode: </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="center">
									<xsl:value-of select="billingMode" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text>. </xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Premium Mode Amount: </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="right">
									<xsl:value-of
										select="format-number(modePremium, '$#,###,###,###,##0.00')" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Amount Received: </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="right">
									<xsl:value-of
										select="format-number(suspenseAmount, '$#,###,###,###,##0.00')" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="left">
									<xsl:text>Amount Due: </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="10pt" text-align="right">
									<xsl:value-of
										select="format-number(amountDue, '$#,###,###,###,##0.00')" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>

				<fo:block line-height="4em">
					<fo:leader />
				</fo:block>


			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
</xsl:stylesheet>
