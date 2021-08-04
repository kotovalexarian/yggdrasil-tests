#!/usr/bin/env ruby
# frozen_string_literal: true

def test(machine, command)
  `rvm system do vagrant ssh #{machine} -c "#{command}"`
end

raise unless test('public1', 'curl http://[200:253d:cbe3:4946:a1db:e5e7:1683:e8da]') == "Hello, World!\r\r\n"
raise unless test('public1', 'curl http://[201:fe7d:4918:f991:b081:9097:7464:7d79]') == "Hello, World!\r\r\n"
raise unless test('public2', 'curl http://[200:253d:cbe3:4946:a1db:e5e7:1683:e8da]') == "Hello, World!\r\r\n"
raise unless test('public2', 'curl http://[201:fe7d:4918:f991:b081:9097:7464:7d79]') == "Hello, World!\r\r\n"
