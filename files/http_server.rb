#!/usr/bin/env ruby

require 'socket'
require 'thread'

server = TCPServer.new '::', 80

loop do
  Thread.new server.accept do |client|
    puts client.gets

    client.print "HTTP/1.1 200\r\n"
    client.print "Content-Type: text/plain\r\n"
    client.print "\r\n"
    client.print "Hello, World!\r\n"

    client.close
  end
end
