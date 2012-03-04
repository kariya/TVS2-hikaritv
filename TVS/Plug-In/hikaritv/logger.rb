$KCODE = 's'

require "socket"

l0 = TCPServer.open(ARGV[0].to_i)
seq = 0

while true 
   l = l0.accept
   
   while buf = l.gets
      if (buf =~ /^Content-Length:/)
         len = buf.sub(/^Content-Length: /, "").to_i
      end
      if (buf == "\r\n")
         break
      end
   end

   data = "";
   if (len == nil) 
	   while buf = l.gets
			data += buf
	   end
   else 
      data = l.read(len)
   end
   
   l.write('HTTP/1.1 200 OK\r\n\r\n')
   l.close

   if (data == "END") 
      break;
   end
   
   File.open(ARGV[1].sub('*', seq.to_s), 'a') { |f|
      seq += 1
      f.puts(data)
      f.close
      # print "...ÇPåèèIóπ\n"
   }
end

l0.close
