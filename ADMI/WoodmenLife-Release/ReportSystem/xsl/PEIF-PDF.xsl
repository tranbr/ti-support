<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes" />
	
	<!-- Support PEIF PDF XSL Transformation Process -->
	
	<xsl:template match="XML__ReportExtract">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		
			<fo:layout-master-set>	
				<fo:simple-page-master master-name="report"					
		 		   	page-height="8.5in" page-width="11in" margin-top="0.25in"
					margin-bottom="0.1in" margin-left=".2in" margin-right=".2in">
					<fo:region-body margin-top=".65in" margin-bottom=".1in" />	
					<fo:region-before extent="5.2in" />						
				</fo:simple-page-master>
			</fo:layout-master-set>
			
			<xsl:apply-templates select="reportExtractSet" />
			
    	</fo:root>
  	</xsl:template>	

	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="REPT__PEIF__GenerateExtract" />
	</xsl:template>	
	
  	<xsl:template match="REPT__PEIF__GenerateExtract">
  		<fo:page-sequence master-reference="report" initial-page-number="1" force-page-count="no-force">
			<fo:static-content flow-name="xsl-region-before">
				
				<fo:table width="100%">
					<fo:table-column column-width="30%" />
					<fo:table-column column-width="40%" />
					<fo:table-column column-width="30%" />
					<fo:table-body>
					
						<fo:table-row>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text>Company: </xsl:text><xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:value-of select="../../companyCode" /><xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:text> Report ID: </xsl:text><xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:value-of select="../../reportID" />
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="sans-serif" font-weight="bold">
									<xsl:value-of select="../../companyName" />
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="right" font-size="10pt" font-family="serif" font-weight="bold">
									<fo:block>Page <fo:page-number/> of <fo:page-number-citation-last ref-id="{generate-id(.)}"/>
									</fo:block>										
								</fo:block>						
							</fo:table-cell>
							
						</fo:table-row>
							
						<fo:table-row>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text>From:</xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="month" select="substring(../../fromDate, 6, 2)"/>
									<xsl:variable name="day" select="substring(../../fromDate, 9)"/>
									<xsl:variable name="year" select="substring(../../fromDate, 1, 4)"/>
									<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
									<xsl:value-of select="$date" />										
									<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:text>Thru:</xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="month2" select="substring(../../thruDate, 6, 2)"/>
									<xsl:variable name="day2" select="substring(../../thruDate, 9)"/>
									<xsl:variable name="year2" select="substring(../../thruDate, 1, 4)"/>
									<xsl:variable name="date2" select="concat($month2, '-', $day2, '-', $year2)" />
									<xsl:value-of select="$date2" />
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
							
						<fo:table-row>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text>Date:</xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="month" select="substring(../../reportDate, 6, 2)"/>
									<xsl:variable name="day" select="substring(../../reportDate, 9)"/>
									<xsl:variable name="year" select="substring(../../reportDate, 1, 4)"/>
									<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
									<xsl:value-of select="$date" />	
									<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:text>Time:</xsl:text><xsl:value-of select="../../reportTime" />
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="sans-serif" font-weight="bold">
									<xsl:value-of select="../../reportDescription" />
								</fo:block>
							</fo:table-cell>
						
							<fo:table-cell>
								<fo:block text-align="right" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text>Printed By:</xsl:text><xsl:value-of select="../../printedBy" />
								</fo:block>						
							</fo:table-cell>
							
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:static-content>

			<fo:flow flow-name="xsl-region-body">
				<fo:table width="100%">
					<fo:table-column column-width="25%" />
					<fo:table-column column-width="50%" />
					<fo:table-column column-width="25%" />
					<fo:table-body>
						
						<fo:table-row>
							<fo:table-cell>	
								<fo:block>
            						&#x00A0;
            					</fo:block>
            				</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text> </xsl:text>  	      
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text> POLICY EXHIBIT CONTROL INFORMATION</xsl:text>
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="right" font-size="10pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text> </xsl:text>  	      
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
												
						<fo:table-row>
							<fo:table-cell>	
								<fo:block>
            						&#x00A0;
            					</fo:block>
            				</fo:table-cell>
						</fo:table-row>
						
					</fo:table-body>
				</fo:table>					
						
				<fo:block>
            		&#x00A0;
   				</fo:block>
  				
   				<fo:block>
            		&#x00A0;
   				</fo:block>
   				
   				<xsl:if test="autoBalance != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:text>AUTO BALANCING IS </xsl:text><xsl:value-of select="autoBalance" />			
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="processMessage != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="processMessage" />		
						</fo:block>	
				</xsl:if>
				
				<xsl:if test="startDate != '' or stopDate != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:text>EXHIBIT START DATE IS </xsl:text>
							<xsl:variable name="month1" select="substring(startDate, 6, 2)"/>
							<xsl:variable name="day1" select="substring(startDate, 9)"/>
							<xsl:variable name="year1" select="substring(startDate, 1, 4)"/>
							<xsl:variable name="date1" select="concat($month1, '-', $day1, '-', $year1)" />
							<xsl:value-of select="$date1" />	
							<xsl:text>, STOP DATE IS </xsl:text>
							<xsl:variable name="month2" select="substring(stopDate, 6, 2)"/>
							<xsl:variable name="day2" select="substring(stopDate, 9)"/>
							<xsl:variable name="year2" select="substring(stopDate, 1, 4)"/>
							<xsl:variable name="date2" select="concat($month2, '-', $day2, '-', $year2)" />
							<xsl:value-of select="$date2" />
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="stateOption != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="stateOption" />		
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="states1 != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="states1" />		
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="states2 != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="states2" />		
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="numberOfBefore != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="numberOfBefore" /><xsl:text> RECORDS WERE PROCESSED FROM THE PREVIOUS FILE</xsl:text>
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="numberOfAfter != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="numberOfAfter" /><xsl:text> RECORDS WERE PROCESSED FROM THE CURRENT FILE</xsl:text>
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="numberOfExhibit != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="numberOfExhibit" /><xsl:text> RECORDS WERE PROCESSED FROM THE EXHIBIT FILE</xsl:text>
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="pebeMessage != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="pebeMessage" />
						</fo:block>	
				</xsl:if>
				
   				<xsl:if test="peerMessage != ''">
						<fo:block>
            				&#x00A0;
   						</fo:block>
   						<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
							<xsl:value-of select="peerMessage" />
						</fo:block>	
				</xsl:if>

				<xsl:apply-templates select="__REPT__PEIF__Total__EntrySet/REPT__PEIF__Total__Entry" />
				
				<fo:block id="{generate-id(.)}"/>
			</fo:flow>		
		</fo:page-sequence>
	</xsl:template>	

	<xsl:template match="REPT__PEIF__Total__Entry">
		<fo:block page-break-before="always" />
		
		<fo:table width="100%">
			<fo:table-column column-width="100%" />
			<fo:table-body>
				
				<fo:table-row>
					<fo:table-cell>	
						<fo:block>
           					&#x00A0;
           				</fo:block>
           			</fo:table-cell>
				</fo:table-row>
								
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="center" font-size="10pt" font-family="sans-serif" font-weight="bold"
							      line-height="1.5em" background-color="black" color="white">
							<xsl:value-of select="../../heading1" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
					
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="center" font-size="10pt" font-family="sans-serif" font-weight="bold"
							      line-height="1.5em" background-color="black" color="white">
							<xsl:value-of select="../../heading2" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
						
				<fo:table-row>
					<fo:table-cell>	
						<fo:block>
   	        				&#x00A0;
   	        			</fo:block>
   	        		</fo:table-cell>
				</fo:table-row>
				
			</fo:table-body>
		</fo:table>
		
		<fo:table width="100%">
			<fo:table-column column-width="5%" />
			<fo:table-column column-width="25%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="15%" />
			<fo:table-column column-width="15%" />
			<fo:table-column column-width="15%" />
			<fo:table-column column-width="15%" />
			<fo:table-body>

				<fo:table-row>
										
					<fo:table-cell>
						<fo:block text-align="left" font-size="8pt" font-family="sans-serif" 
						          font-weight="bold" line-height="1.5em">
							<xsl:text> </xsl:text>
						</fo:block>
					</fo:table-cell>
											
					<fo:table-cell>
						<fo:block text-align="left" font-size="8pt" font-family="sans-serif" 
						          font-weight="bold" line-height="1.5em">
							<xsl:text> </xsl:text>
						</fo:block>
					</fo:table-cell>
						
					<fo:table-cell>
						<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
						          font-weight="bold" line-height="1.5em">
							<xsl:value-of select="header1" />
						</fo:block>
					</fo:table-cell>
												
					<fo:table-cell>
						<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
						          font-weight="bold" line-height="1.5em">
							<xsl:value-of select="header2" />
						</fo:block>
					</fo:table-cell>
												
					<fo:table-cell>
						<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
						          font-weight="bold" line-height="1.5em">
							<xsl:value-of select="header3" />
						</fo:block>
					</fo:table-cell>
												
					<fo:table-cell>
						<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
						          font-weight="bold" line-height="1.5em">
							<xsl:value-of select="header4" />
						</fo:block>
					</fo:table-cell>
						
					<fo:table-cell>
						<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
						          font-weight="bold" line-height="1.5em">
							<xsl:value-of select="header5" />
						</fo:block>
					</fo:table-cell>
					
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		
		<xsl:apply-templates select="__REPT__PEIF__Line__EntrySet/REPT__PEIF__Line__Entry" />
		
	</xsl:template>
	
	<xsl:template match="REPT__PEIF__Line__Entry">
		
		<xsl:if
			test="count(preceding-sibling::REPT__PEIF__Line__Entry) mod 4 = 0 and
		          count(preceding-sibling::REPT__PEIF__Line__Entry) > 0">
			<fo:block page-break-before="always" />
					
			<fo:table width="100%">
				<fo:table-column column-width="5%" />
				<fo:table-column column-width="25%" />
				<fo:table-column column-width="10%" />
				<fo:table-column column-width="15%" />
				<fo:table-column column-width="15%" />
				<fo:table-column column-width="15%" />
				<fo:table-column column-width="15%" />
				<fo:table-body>

					<fo:table-row>
										
						<fo:table-cell>
							<fo:block text-align="left" font-size="8pt" font-family="sans-serif" 
							          font-weight="bold" line-height="1.5em">
								<xsl:text> </xsl:text>
							</fo:block>
						</fo:table-cell>
											
						<fo:table-cell>
							<fo:block text-align="left" font-size="8pt" font-family="sans-serif" 
							          font-weight="bold" line-height="1.5em">
								<xsl:text> </xsl:text>
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell>
							<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
							          font-weight="bold" line-height="1.5em">
								<xsl:value-of select="//header1" />
							</fo:block>
						</fo:table-cell>
												
						<fo:table-cell>
							<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
							          font-weight="bold" line-height="1.5em">
								<xsl:value-of select="//header2" />
							</fo:block>
						</fo:table-cell>
												
						<fo:table-cell>
							<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
							          font-weight="bold" line-height="1.5em">
								<xsl:value-of select="//header3" />
							</fo:block>
						</fo:table-cell>
												
						<fo:table-cell>
							<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
							          font-weight="bold" line-height="1.5em">
								<xsl:value-of select="//header4" />
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell>
							<fo:block text-align="right" font-size="8pt" font-family="sans-serif" 
							          font-weight="bold" line-height="1.5em">
								<xsl:value-of select="//header5" />
							</fo:block>
						</fo:table-cell>
					
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:if>
		
		<fo:table width="100%">
			<fo:table-column column-width="40%" />
			<fo:table-column column-width="60%" />
			<fo:table-body>
		
			<fo:table-row>
				<fo:table-cell>
					<fo:block font-size="9pt" text-align="left" padding="2pt">
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		
			<fo:table-row>
				<fo:table-cell>
					<fo:block font-size="9pt" text-align="left" padding="2pt">
						<xsl:value-of select="messageLine" />
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			
			</fo:table-body>
		</fo:table>
		
		<xsl:apply-templates select="__REPT__PEIF__Line__DetailSet/REPT__PEIF__Line__Detail" />
	
	</xsl:template>
		
	<xsl:template match="REPT__PEIF__Line__Detail">
		
		<fo:table width="100%">
			<fo:table-column column-width="5%" />
			<fo:table-column column-width="25%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="15%" />
			<fo:table-column column-width="15%" />
			<fo:table-column column-width="15%" />
			<fo:table-column column-width="15%" />
			<fo:table-body>
		
				<fo:table-row>
				
					<fo:table-cell>
						<fo:block font-size="9pt" text-align="left" padding="2pt">
							<xsl:text> </xsl:text>
						</fo:block>
					</fo:table-cell>
			
					<fo:table-cell>
						<fo:block font-size="9pt" text-align="left" padding="2pt">
							<xsl:value-of select="detailMessage" />
						</fo:block>
					</fo:table-cell>
			
					<fo:table-cell>
						<fo:block font-size="9pt" text-align="right" padding="2pt">
							<xsl:if test="policyCount != ''">
								<xsl:value-of select="format-number(policyCount, '##,###,##0')" />
							</xsl:if>
						</fo:block>
					</fo:table-cell>
						
					<fo:table-cell>
						<fo:block font-size="9pt" text-align="right" padding="2pt">
							<xsl:if test="faceAmount != ''">
								<xsl:value-of select="format-number(faceAmount, '$##,###,###,###,##0.00')" />
							</xsl:if>
						</fo:block>
					</fo:table-cell>
									
					<fo:table-cell>
						<fo:block font-size="9pt" text-align="right" padding="2pt">
							<xsl:if test="corridor != ''">
								<xsl:value-of select="format-number(corridor, '$##,###,###,###,##0.00')" />
							</xsl:if>
						</fo:block>
					</fo:table-cell>
												
					<fo:table-cell>
						<fo:block font-size="9pt" text-align="right" padding="2pt">
							<xsl:if test="cashValueNetPrem != ''">
								<xsl:value-of select="format-number(cashValueNetPrem, '$##,###,###,###,##0.00')" />
							</xsl:if>
						</fo:block>
					</fo:table-cell>
															
					<fo:table-cell>
						<fo:block font-size="9pt" text-align="right" padding="2pt">
							<xsl:if test="deathBenefit != ''">
								<xsl:value-of select="format-number(deathBenefit, '$##,###,###,###,##0.00')" />
							</xsl:if>
						</fo:block>
					</fo:table-cell>
			
				</fo:table-row>
			</fo:table-body>
		</fo:table>

	</xsl:template>	
</xsl:stylesheet>