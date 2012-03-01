f = open(ARGV[0], "r")

while (line = f.gets) 
   if (line =~ /.*\[.*\]$/) 
      crid = line.sub(/^.*\[/, "").sub(/\]$/, "")
      print "SET CRID=" + crid
      break
   end
end

