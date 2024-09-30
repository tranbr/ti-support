Setting up MICR fonts for checks

1. Purchase a commercial MICR font that is guaranteed to conform to ANSI standards.

2. Do ONE of the following:

	a. Install the font in the fonts folder (same folder as this Read Me file).
	
	b. Install the font in another folder. Add the path of the folder to the config.xml
	   located in the resources folder.
	   
3. Set the variable called MICR-FONT in ADMI-UTILS.xsl to the font that was installed in step 2.