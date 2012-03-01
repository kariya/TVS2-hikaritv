$KCODE = 'u'

def levenshtein_distance(s1, s2) 
   a1 = s1.split ''
   a2 = s2.split ''
   len1 = a1.length
   len2 = a2.length
   distance = {}
   for i in 0..len1
      for j in 0..len2
         distance[[i,j]] = 0
      end
   end
   for i in 0..len1 
      distance[[i,0]] = i
   end
   for j in 0..len2
      distance[[0,j]] = j
   end
   for i in 1..len1
      for j in 1..len2
         cost = 0
         if (a1[i-1] == a2[j-1]) 
            cost = 0
         else
            cost = 1
         end
         distance[[i,j]] = [distance[[i - 1,j]] + 1, distance[[i,j - 1]] + 1, distance[[i - 1,j - 1]] + cost].min
      end
   end
   return distance[[len1,len2]]
end


table = Hash::new
IO.popen("hikaritv/nkf32 -w ../tvscat.csv") do |io|
   isFirst = true
   while (line = io.gets)
      if (isFirst) 
        isFirst = false
        next
     end
     fields = line.split ','
     table[fields[0]] = fields[1]
   end
   io.close
end

cache = Hash::new
while (line = gets)
   fields = line.split ','
   next unless fields.length == 11
   target = fields[5]
   if (!cache.has_key?(target)) 
      min = 9999
      result = nil
      table.each_key do |key|
         d = levenshtein_distance(table[key], target)
         if (d < min) 
            result = key
            min = d
         end
      end
      cache[target] = result
   end
   print fields[0] + "," + fields[1] + "," + fields[2] + "," + fields[3] + "," + fields[4] + "," + cache[target] + "," + fields[6] + "," + fields[7] + "," + fields[8] + "," + fields[9] + "," + fields[10]
end

