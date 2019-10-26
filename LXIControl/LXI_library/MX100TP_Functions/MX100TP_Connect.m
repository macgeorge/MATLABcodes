function result = MX100TP_Connect(ip)
    result = tcpip(ip, 9221);
end