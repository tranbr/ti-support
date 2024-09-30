<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="XML__ReportExtract">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="all"					
					page-height="8.5in" page-width="11in" margin-top="0.25in"
					margin-bottom="0.1in" margin-left=".2in" margin-right=".2in">
					<fo:region-body margin-top=".65in" margin-bottom=".1in" />	
					<fo:region-before extent="5.2in" />						
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="all">
  				<fo:static-content flow-name="xsl-region-before">          
					<fo:table width="100%">
						<fo:table-column column-width="30%" />
						<fo:table-column column-width="40%" />
						<fo:table-column column-width="30%" />
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8pt" font-family="serif" font-weight="bold">
										<xsl:text>Company Code:</xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="./companyCode" />
										<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
										<xsl:text>Report ID:</xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="./reportID" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="./companyName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8pt" font-family="serif" font-weight="bold">
										<fo:block>Page <fo:page-number/> of
											<fo:page-number-citation ref-id="theEnd"/>
										</fo:block>										
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8pt" font-family="serif" font-weight="bold">
										<xsl:text>From:</xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:variable name="month" select="substring(./fromDate, 6, 2)"/>
										<xsl:variable name="day" select="substring(./fromDate, 9)"/>
										<xsl:variable name="year" select="substring(./fromDate, 1, 4)"/>
										<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
										<xsl:value-of select="$date" />										
										<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
										<xsl:text>Thru:</xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:variable name="month2" select="substring(./thruDate, 6, 2)"/>
										<xsl:variable name="day2" select="substring(./thruDate, 9)"/>
										<xsl:variable name="year2" select="substring(./thruDate, 1, 4)"/>
										<xsl:variable name="date2" select="concat($month2, '-', $day2, '-', $year2)" />
										<xsl:value-of select="$date2" />	
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8pt" font-family="serif" font-weight="bold">
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
									<fo:table-cell>
									<fo:block text-align="center" font-size="8pt" font-family="serif" font-weight="bold">
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>				
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8pt" font-family="serif" font-weight="bold">
										<xsl:text>Date:</xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:variable name="month" select="substring(./reportDate, 6, 2)"/>
										<xsl:variable name="day" select="substring(./reportDate, 9)"/>
										<xsl:variable name="year" select="substring(./reportDate, 1, 4)"/>
										<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
										<xsl:value-of select="$date" />	
										<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
										<xsl:text>Time:</xsl:text>
										<xsl:value-of select="./reportTime" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8pt" font-family="serif" font-weight="bold">
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8pt" font-family="serif" font-weight="bold">
										<xsl:text>Printed By:</xsl:text>
										<xsl:value-of select="./printedBy" />
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>				
						</fo:table-body>
					</fo:table>
					<fo:block font-size="10pt" font-family="sans-serif"
						line-height="1.5em" background-color="black" color="white"
						text-align="center">
						<xsl:value-of select="./reportDescription" />
					</fo:block>
				</fo:static-content>				
				<fo:flow flow-name="xsl-region-body">					
					<xsl:apply-templates select="reportExtractSet" />
					<xsl:apply-templates select="totals" />
					<fo:block id="theEnd"/>
				</fo:flow>		
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<fo:table width="100%">
			<fo:table-column column-width="3%" /> <!-- Company Code -->
			<fo:table-column column-width="9%" /> <!-- Agent Number -->
			<fo:table-column column-width="4%" /> <!-- Situation Code -->
			<fo:table-column column-width="6%" /> <!-- Transaction Code -->
			<fo:table-column column-width="9%" /> <!-- Transaction Amount -->
			<fo:table-column column-width="9%" /> <!-- Policy Number -->
			<fo:table-column column-width="9%" /> <!-- Policy Premium -->
			<fo:table-column column-width="7%" /> <!-- Effective Date -->
			<fo:table-column column-width="10%" /> <!-- Account Number -->
			<fo:table-column column-width="7%" /> <!-- Department Desk -->
			<fo:table-column column-width="5%" /> <!-- Batch Number -->
			<fo:table-column column-width="7%" /> <!-- Journal Date -->
			<fo:table-column column-width="12%" /> <!-- Description -->
			<fo:table-column column-width="3%" /> <!-- Class Code -->	
			<fo:table-header>
				<fo:table-row>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">CMP</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Agent Number</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Sit Code</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Tran Code</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Tran Amount</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Policy Number</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Policy Premium</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">EFT Date</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Account Number</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">DP Desk</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Batch Number</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">JRNL Date</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">Description</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" font-weight="bold" text-align="center">CLS</fo:block>
					</fo:table-cell>										
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
				<xsl:apply-templates select="GAAC__AccountingExtract" />
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="totals">
		<fo:table width="100%">
			<fo:table-column column-width="13%" /> 
			<fo:table-column column-width="8%" /> 
			<fo:table-column column-width="5%" /> 
			<fo:table-column column-width="9%" /> 
			<fo:table-column column-width="14%" /> 
			<fo:table-column column-width="9%" /> 
			<fo:table-column column-width="14%" /> 
			<fo:table-column column-width="9%" /> 
			<fo:table-column column-width="19%" /> 
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block font-weight="bold" font-size="8pt" text-align="left" padding="1pt">
							<xsl:text>GLED Report Totals:</xsl:text>
						</fo:block>
					</fo:table-cell>	
					<fo:table-cell>
						<fo:block font-weight="bold" font-size="8pt" text-align="right" padding="1pt">
							<xsl:text>Records</xsl:text>
							<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>						
						</fo:block>
					</fo:table-cell>					
					<fo:table-cell >
						<fo:block font-size="8pt" text-align="left" padding="1pt"> 
							<xsl:value-of select="format-number(totalAcctRecords, '#########0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block font-weight="bold" font-size="8pt" text-align="right" padding="1pt">
							<xsl:text>Debits</xsl:text>
							<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>		
						</fo:block>
					</fo:table-cell>
					<fo:table-cell >
						<fo:block font-size="8pt" text-align="left" padding="1pt"> 
							<xsl:value-of select="format-number(totalDebitAmount, '$,#,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block font-weight="bold" font-size="8pt" text-align="right" padding="1pt">
							<xsl:text>Credits</xsl:text>
							<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>		
						</fo:block>
					</fo:table-cell>
					<fo:table-cell >
						<fo:block font-size="8pt" text-align="left" padding="1pt"> 
							<xsl:value-of select="format-number(totalCreditAmount, '$,#,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>								
					<fo:table-cell>
						<fo:block font-weight="bold" font-size="8pt" text-align="right" padding="1pt">
							<xsl:text>Net To Cash</xsl:text>
							<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>		
						</fo:block>
					</fo:table-cell>
					<fo:table-cell >
						<fo:block font-size="8pt" text-align="left" padding="1pt"> 
							<xsl:value-of select="format-number(totalNetToCashAmount, '$,#,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>									
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>	
	<xsl:template match="GAAC__AccountingExtract">
		<fo:table-row>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:value-of select="__GAAC__PrimaryKey/__COMPANY__CODE" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt"> 
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__AGNT__OR__REFERENCE" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt"> 
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__AMS__SITUATION" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__TRANSACTION__CODE" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="right" padding="1pt">
					<xsl:value-of select="format-number(__GAAC__ACCOUNTING__RECORD/__TRANS__AMOUNT, '$#,##0.00')" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__POLICY__NUMBER" />
				</fo:block>
			</fo:table-cell>		
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="right" padding="1pt"> 
					<xsl:value-of select="format-number(__GAAC__ACCOUNTING__RECORD/__CASH__AMOUNT, '$#,###,##0.00')" />
				</fo:block>
			</fo:table-cell>		
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt"> 
					<xsl:variable name="month" select="substring(__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__SEQ__XDATE, 6, 2)"/>
					<xsl:variable name="day" select="substring(__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__SEQ__XDATE, 9)"/>
					<xsl:variable name="year" select="substring(__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__SEQ__XDATE, 1, 4)"/>
					<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
					<xsl:value-of select="$date" />	
				</fo:block>
			</fo:table-cell>			
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt"> 
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__ACCOUNT__NUMBER" />
				</fo:block>
			</fo:table-cell>		
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__PRIMARY__KEY/__DPDESK" />
				</fo:block>
			</fo:table-cell>			
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt"> 
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__PRIMARY__KEY/__BATCH__OR__VOUCHER" />
				</fo:block>
			</fo:table-cell>			
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:variable name="month" select="substring(__COMPANY__DATE, 6, 2)"/>
					<xsl:variable name="day" select="substring(__COMPANY__DATE, 9)"/>
					<xsl:variable name="year" select="substring(__COMPANY__DATE, 1, 4)"/>
					<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
					<xsl:value-of select="$date" />	
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt"> 
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__DESCRIPTION__FIELD" />
				</fo:block>
			</fo:table-cell>				
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt"> 
					<xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__CLASS__CODE" />
				</fo:block>
			</fo:table-cell>							
		</fo:table-row>	
	</xsl:template>	
</xsl:stylesheet>