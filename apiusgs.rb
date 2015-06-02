require 'nokogiri'
require 'open-uri'
	xml_file = open('http://waterservices.usgs.gov/nwis/iv/?format=waterml,1.1&sites=01037000&parameterCd=00060,00065')
 	doc = Nokogiri::XML(xml_file)
 	doc.xpath('//ns1:values/ns1:value').each do |node|
 	puts node.text
 	end 

	