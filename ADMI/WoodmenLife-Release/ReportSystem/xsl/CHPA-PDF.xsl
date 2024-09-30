<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
 	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="XML__ReportExtract">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="each"
					page-height="3.5in" page-width="8.5in" margin-top="0.25in"
					margin-bottom="0.1in" margin-left=".2in" margin-right=".2in">
					<fo:region-body margin-top=".1in" margin-bottom=".1in" />
					<fo:region-before extent="5.2in" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<xsl:apply-templates select="reportExtractSet" />
		</fo:root>
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="CKXT__Check__Ext" />
	</xsl:template>
	<xsl:template match="CKXT__Check__Ext">
		<fo:page-sequence master-reference="each">
			<fo:flow flow-name="xsl-region-body">
				<fo:table width="90%" border-color="black" border-style="solid" border-width="1pt">
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block margin="2mm" text-align="right" font-size="8pt" line-height="2em" font-family="sans-serif" font-weight="bold">
									<xsl:value-of select="__CHECK__NUMBER" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8pt" font-family="sans-serif"
									line-height="2em" background-color="white" color="black"
									text-align="right" margin="2mm">
									<xsl:text>Date  </xsl:text>
									<xsl:variable name="month" select="substring(__CHECK__DATE, 6, 2)"/>
									<xsl:variable name="day" select="substring(__CHECK__DATE, 9)"/>
									<xsl:variable name="year" select="substring(__CHECK__DATE, 1, 4)"/>
									<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
									<xsl:value-of select="$date" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:table>
									<fo:table-column column-width="80%" />
									<fo:table-column column-width="20%" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell>
												<fo:block font-size="8pt" font-family="sans-serif"
													line-height="2em" background-color="white" color="black"
													text-align="left" margin="2mm">
													<xsl:text>Pay to the order of  </xsl:text>
													<xsl:value-of select="__PAYEE__NAME" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block font-size="8pt" font-family="sans-serif"
													line-height="2em" background-color="white" color="black"
													text-align="right" margin="2mm">
													<xsl:text>$</xsl:text>
													<xsl:value-of select="__CHECK__AMOUNT" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8pt" font-family="sans-serif"
									line-height="2em" background-color="white" color="black"
									text-align="left" margin="2mm">
									<xsl:value-of select="amountInWords" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:table>
									<fo:table-column column-width="60%" />
									<fo:table-column column-width="40%" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell>
												<fo:block font-size="8pt" font-family="sans-serif"
													line-height="2em" background-color="white" color="black"
													text-align="left" margin="2mm">
													<xsl:value-of select="__CHECK__DESCRIPTION" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block background-color="white" margin="2mm">
													<xsl:variable name="imagePath" select="concat($GRAPHICS-FOLDER, $SIGNATURE-FILENAME)"/>
													<fo:external-graphic content-height="scale-to-fit" scaling="non-uniform">
													 	<xsl:attribute name="src">
													 		<xsl:value-of select="$imagePath" />
													 	</xsl:attribute>
													 	<xsl:attribute name="height">
													 		<xsl:value-of select="$SIGNATURE-HEIGHT" />
													 	</xsl:attribute>
													 	<xsl:attribute name="content-width">
													 		<xsl:value-of select="$SIGNATURE-WIDTH" />
													 	</xsl:attribute>
													 </fo:external-graphic>
												 </fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="12pt" font-family="{$MICR-FONT}"
									line-height="2em" background-color="white" color="black"
									text-align="left" margin="2mm">
									<xsl:text>   A123456789   A0123456789    A</xsl:text>
									<xsl:value-of select="__CHECK__NUMBER" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
</xsl:stylesheet>
	