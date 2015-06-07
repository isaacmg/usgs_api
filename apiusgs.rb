require 'nokogiri'
require 'open-uri'
require "rubygems"
require "json"
	# Get the url from http://waterservices.usgs.gov/rest/IV-Test-Tool.html 
	xml_file = open('http://waterservices.usgs.gov/nwis/iv/?format=waterml,1.1&sites=01037000&parameterCd=00060,00065')
 	doc = Nokogiri::XML(xml_file)
 	# This will print the flow data and the gage height (and any other parameters you requested).  
 	doc.xpath('//ns1:values/ns1:value').each do |node|
 	puts node.text
 	end 
 	# Optionally you can get weather data from WunderGround. Replace mykey with your actual API key. 
	file = open("http://api.wunderground.com/api/mykey/q/ME/Bangor.json")
	json = file.read
	parsed = JSON.parse(json)
	puts parsed["current_observation"]["temp_f"]
	