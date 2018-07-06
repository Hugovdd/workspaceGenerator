-- Folder structure generator for TCC at Brave
-- Hugo van den Doel at Brave, 2018;

try
    set jobNumber to the text returned of (display dialog "What is the job number?" default answer "")
    
    set jobName to the text returned of (display dialog "What is the job name?" default answer "")
    
    set jobFolder to jobNumber & "_" & jobName
    
    -- Choose project location
    
    tell application "Finder"
        
        if (disk "Brave" exists) then
            set targetLocation to (choose folder with prompt "Choose location for new project" default location ("/Volumes/Brave/Brave Creative/2018"))
        else
            set targetLocation to (choose folder with prompt "Choose location for new project" default location (path to desktop))
        end if
        
    end tell
    
    tell application "Finder"
        
        -- creates root folder
        set PROJECT_ROOT to make new folder at targetLocation with properties {name:jobFolder}
        
        -- creates design folder and sub folders
        
        set designRoot to make new folder at PROJECT_ROOT with properties {name:"01_Design"}
        
        set designActivations to make new folder at designRoot with properties {name:"01_Activations"}
        set designKv to make new folder at designRoot with properties {name:"02_KV's"}
        
        set activationsJpeg to make new folder at designActivations with properties {name:"01_JPG"}
        set activationsPsd to make new folder at designActivations with properties {name:"02_PSD"}
        
        set kvJpeg to make new folder at designKv with properties {name:"01_JPG"}
        set kvPsd to make new folder at designKv with properties {name:"02_PSD"}
        
        
        -- create images folder and sub folders
        set imagesRoot to make new folder at PROJECT_ROOT with properties {name:"02_Images"}
        
        set imagesShutterstock to make new folder at imagesRoot with properties {name:"01_Shutterstock"}
        set imagesGetty to make new folder at imagesRoot with properties {name:"02_Getty"}
        set imagesOffset to make new folder at imagesRoot with properties {name:"03_Offset"}
        set imagesGoogle to make new folder at imagesRoot with properties {name:"04_Google"}
        set imagesWebsite to make new folder at imagesRoot with properties {name:"05_Website"}
        
        
        set shutterstockDownloaded to make new folder at imagesShutterstock with properties {name:"01_Downloaded"}
        set shutterstockUsed to make new folder at imagesShutterstock with properties {name:"02_Used"}
        
        set gettyDownloaded to make new folder at imagesGetty with properties {name:"01_Downloaded"}
        set gettyUsed to make new folder at imagesGetty with properties {name:"02_Used"}
        
        set offsetDownloaded to make new folder at imagesOffset with properties {name:"01_Downloaded"}
        set offsetUsed to make new folder at imagesOffset with properties {name:"02_Used"}
        
        
        -- create doc elements folder
        set docElementsRoot to make new folder at PROJECT_ROOT with properties {name:"03_Doc_Elements"}
        
        -- create fonts folder
        set fontsRoot to make new folder at PROJECT_ROOT with properties {name:"04_Fonts"}
        
        -- create supplied folder
        set suppliedRoot to make new folder at PROJECT_ROOT with properties {name:"05_Supplied"}
        
        -- create video folder and sub folders
        set videoRoot to make new folder at PROJECT_ROOT with properties {name:"03_Video"}
        
        set videoAfterEffects to make new folder at videoRoot with properties {name:"01_AFX"}
        set videoPremierePro to make new folder at videoRoot with properties {name:"02_Premiere"}
        set videoAssets to make new folder at videoRoot with properties {name:"03_Assets"}
        set videoExports to make new folder at videoRoot with properties {name:"04_Exports"}
        set videoDelivery to make new folder at videoRoot with properties {name:"05_Delivery"}
        set videoFileCollections to make new folder at videoRoot with properties {name:"06_File_Collections"}
        
        
        
        --      do shell script "echo 'File naming structure.' > " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo 'Please cut and paste this line when you originally save out a file and update per project:' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo '' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo '000000_XXX_Project Name_Element_V01' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo '' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo '000000 - Job Number' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo 'XXX - Will be an abbreviation for the client. For example Lagardere LGD, Panasonic PAN etc' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo 'Project name - is the project name' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo 'Element- is the design element you are working on, MPU, POS, Key Visual, Sizzle Reel, Website etc' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
        --      do shell script "echo 'Version' >> " & quoted form of POSIX path of targetLocation & jobFolder & "/README.txt"
    end tell
    
    
    -- Open file in Finder
    
    tell application "Finder"
        activate
        if window 1 exists then
            set target of window 1 to PROJECT_ROOT
        else
            reveal PROJECT_ROOT
        end if
    end tell
    
    
    -- Catch errors 
on error error_message number error_number
    display alert ("YIKES! Something went wrong!") ¬
        message error_message ¬
        & (" Error number ") & error_number & "."
end try