# coding: utf-8
# Copyright 2018 The Moov Authors
# Use of this source code is governed by an Apache License
# license that can be found in the LICENSE file.
require 'json'
require 'net/http'
require 'rainbow'
require 'securerandom'
require 'uri'

VERSION = File.read("./version")

def main()
  puts Rainbow("Moov ACH Ruby Demo (version %s)" % VERSION).green

  resp = Net::HTTP.get(URI("http://ach:8080/ping"))
  raise Rainbow("Problem connecting to ACH service: %s" % resp).red unless resp.include?("PONG")

  # Create out ACH file
  fileId = SecureRandom.hex
  file = {
    :id => fileId,
    :fileHeader => {
      :id => fileId,
      :immediateDestinationName => "Citadel",
      :immediateDestination => "231380104",
      :immediateOriginName => "Wells Fargo",
      :immediateOrigin => "121042882",
    },
    :batches => [
      {
        :batchHeader => {
          :id => fileId + "-1",
          :serviceClassCode => 200,
          :companyName => "Wells Fargo",
          :companyIdentification => "121042882",
          :standardEntryClassCode => "PPD",
          :companyEntryDescription => "Trans. Des",
          :effectiveEntryDate => "2018-10-09T00:00:00Z",
          :ODFIIdentification => "12104288",
        },
        :entryDetails => [
          {
            :id => fileId + '-1',
            :transactionCode => 22,
            :RDFIIdentification => "23138010",
            :checkDigit => "4",
            :DFIAccountNumber => "81967038518",
            :amount => 100000,
            :identificationNumber => "#83738AB#",
            :individualName => "Steven Tander",
            :discretionaryData => "",
            :addendaRecordIndicator => 1,
            :traceNumber => 121042880000001,
            :category => "Forward"
          },
        ],
        :batchControl => {
          :id => fileId + '-1',
          :serviceClassCode => 200,
          :entryAddendaÇount => 2,
          :entryHash => 23138010,
          :totalDebit => 0,
          :totalCredit => 100000,
          :companyIdentification => "121042882",
          :ODFIIdentification => "12104288",
        },
      }
    ],
    :fileControl => {
      :id => fileId,
    },
  }
  uri = URI("http://ach:8080/files/create")
  req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
  req.body = file.to_json
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    resp = http.request(req)
    if resp.code != "200"
      puts Rainbow("Problem creating ACH file (status:%s): %s" % [resp.code + resp.msg, resp.body]).red
      exit 1
    end
    resp.body
  end

  fileId = JSON.parse(resp.body)["id"]
  puts "File %s created" % fileId

  # Build file and get contents
  req = Net::HTTP::Get.new(URI("http://ach:8080/files/%s/contents" % fileId))
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    resp = http.request(req)
    if resp.code != "200"
      puts Rainbow("Problem creating ACH file: %s" % resp.msg).red
      exit 1
    end

    puts "File created successfully"
  end

  # Validate file
  req = Net::HTTP::Get.new(URI("http://ach:8080/files/%s/contents" % fileId))
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    resp = http.request(req)
    if resp.code != "200"
      error = JSON.parse(resp.body)["error"]
      puts Rainbow("Problem validating ACH file: %s" % error).red
      exit 1
    end

    puts "File validated successfully"
  end
end

main
