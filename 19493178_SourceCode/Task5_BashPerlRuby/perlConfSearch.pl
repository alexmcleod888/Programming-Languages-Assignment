#!usr/bin/perl

use File::Find;

# use the find module to cycle through all files and directories
# imports a code reference checkFile to do verification on each file
# parameter two being the starting directory
find(\&checkFile, "/");

# subroutine that imports a file and outputs a file if its a .conf
sub checkFile 
{
    # get the imported filename and assign to $file
    my $file = $_;

    # use a regex to see if $file matches the regex expression
    # pattern to match is contained within /      /
    # \. specifies the . character
    # anchor $ matches the end of the string
    # hence end of the string must match .conf
    if($file =~ /\.conf$/) 
    {  
	# if we have a match print the filename, followed by a new line
	#period concatenates the file and its path to the new line character
        print $File::Find::name."\n";
    	
    }  
    #print $File::Find::name."\n" if -f $file;
    
    #print $File::Find::name."\n" if ($file =~ /\.conf$/i );
    
}

