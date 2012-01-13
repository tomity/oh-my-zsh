def my_ip_addresses
  ip_addresses = []
  open("| ifconfig | grep \"inet\"") do |fh|
    fh.each do |line|
      if line =~ /(\d+\.\d+\.\d+\.\d+)/
        ip_addresses << $1
      else
      end
    end
  end
  ip_addresses.delete("127.0.0.1")
  return ip_addresses
end

puts "Please add my any local repository: "
my_ip_addresses.each do |ip_address|
  puts "git remote add [name] git://#{ip_address}/[repository]"
end
