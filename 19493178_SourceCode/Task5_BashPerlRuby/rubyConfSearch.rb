#!/usr/bin/ruby

require 'find'

# initialise a new empty array
pdf_file_paths = []

# use the find module to go through each path in the system
# loop through each path starting at the first directory of the computer
Find.find('/') do |path|
  # if the file at the particular path has .conf at the end of it
  # add to the list of paths. This is done by checking if it matches
  # the regex defined between /       /
  pdf_file_paths.append(path) if path =~ /.*\.conf$/
end

Find.find('/home') do |path|
  # if the file at the particular path has .conf at the end of it
  # add to the list of paths. This is done by checking if it matches
  # the regex defined between /       /
  pdf_file_paths.append(path) if path =~ /.*\.conf$/
end

# intialise a counter to to cycle through each path in the list 
$counter = 0 
# while there are still more paths in the list keeping printing them out
while $counter < pdf_file_paths.length do
  # output the path at the particular counter index in the array
  print pdf_file_paths[$counter] + "\n"
  # increment the counter
  $counter +=  1
end
