require 'net/http'
require 'rainbow'
require 'uri'

VERSION = File.read("./version")

def main()
  puts Rainbow("Moov ACH Ruby Demo (version %s)" % VERSION).green

  resp = Net::HTTP.get(URI("http://ach:8080/ping"))
  raise Rainbow("Problem connecting to ACH service: %s" % resp).red unless resp.include?("PONG")
end

main
