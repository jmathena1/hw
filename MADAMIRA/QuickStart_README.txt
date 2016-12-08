                MADAMIRA Quick Start README.txt
               =================================

This file provides quick start up instructions for MADAMIRA. 

Refer to MADAMIRA-UserManual.pdf for more detailed instructions.

This release version has no expiration.


1. Requirements:
----------------
1.1. 2.5GB of RAM memory.

1.2. LDC’s Standard Arabic Morphological Analyzer (SAMA) version 3.1. Not
  included in unbundled releases. Follow instructions in resources/INSTALL.pl
  to install this resource.

1.3. Java version 1.7.* or more recent.

   Use following command to check your Java version.

   % java -version.

   If you do not have Java, or the right Java version, follow instructions in
   section 4 of this file.

   
2. Running MADAMIRA in Standalone Mode:
---------------------------------------
Use the following command to process an XML file.

% java -Xmx2500m -Xms2500m -XX:NewRatio=3 -jar MADAMIRA-release-20160516-2.1.jar -i samples/xml/SampleInputFile.xml  -o  SampleOutputFile.xml

Use the following command to process a raw file.

% java -Xmx2500m -Xms2500m -XX:NewRatio=3 -jar MADAMIRA-release-20160516-2.1.jar -rawinput samples/raw/SampleTextInput.txt -rawoutdir  . -rawconfig samples/sampleConfigFile.xml

You may compare your output files with the output files in the samples directory.


3. Running MADAMIRA in Client-Server Mode:
------------------------------------------

Use the following command to start the server.

% java -Xmx2500m -Xms2500m -XX:NewRatio=3 -jar MADAMIRA-release-20160516-2.1.jar -s

On a separate shell/command prompt, use the following command to run the client. 

% java -Xmx2500m -Xms2500m -XX:NewRatio=3 -jar MADAMIRA-release-20160516-2.1.jar -c -i samples/xml/SampleInputFile.xml  -o  SampleOutputFile.xml


4. Setting up Java 1.7.* (THIS HAS TO BE DONE ONLY ONCE)
--------------------------------------------------------

4.1. If you do not have Java on your machine,
    download and install java from,
    http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
    

4.2. Update environment variables.
    
	For Linux: 
	  To find your shell type, type 
      % echo $SHELL
   
      For bash Shell: 
        1. Edit the startup file (~/ .bashrc)

        2. Modify PATH variable:
             PATH=path-to-jdk-bin-directory:"$PATH"
             export PATH
           
             for example,
             PATH=/export/projects/nlp/nadia/temp-java/jdk1.7.0_25/bin:"$PATH"
             export PATH
           
           
        3. Save and close the file
           
        4. Open new Terminal window
           
        5. Verify the PATH is set properly
           % java -version

      For C Shell (csh):
        1. Edit startup file (~/ .cshrc)
        
        2. Set Path
             set path=path-to-jdk-bin-directory:"$PATH"
        
             for example,
             set path=/export/projects/nlp/nadia/temp-java/jdk1.7.0_25/bin:"$PATH"
        
        3. Save and Close the file
        
        4. Open new Terminal window
        
        5. Verify the PATH is set properly
           % java -version
        
    For Windows:
      Follow instructions at,        
		http://www.java.com/en/download/help/path.xml	


