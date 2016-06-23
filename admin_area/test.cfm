<a href="showPdf.cfm?file=HUD_50039.pdf" target="_blank">test.pdf</a>



<cfabort>


<cfset encrypted=encrypt('HUD_50039.pdf', 'OurEncrypt2112', Form.myAlgorithm, 
            Form.myEncoding)>
            
            
            
        //Decrypt it 
        decrypted=decrypt(encrypted, theKey, Form.myAlgorithm, Form.myEncoding); 

