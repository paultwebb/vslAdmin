package gov.vt.vslAdmin

import gov.vt.vslAdmin.County
import gov.vt.vslAdmin.GnisLocale

import gov.vt.vslAdmin.Town
import gov.vt.vslAdmin.District
import gov.vt.vslAdmin.Representative
import org.grails.plugins.csv.CSVMapReader

class LoadCsvService {

	def DataSource
	String filePath = "/Users/paulw/Downloads"
	String fileName
	
    def loadCounty() {
		fileName = "VermontHouse - County.csv"
		County curCounty
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
		   curCounty = new County(map)
		   if (curCounty.save()) {
			  results[curCounty.county] = 'Loaded'
		   }
		   else {
			 println "Error ${map['county']}"
			 println curCounty.errors.fieldErrors
			 results[curCounty.county] = curCounty.errors			 
			}
		  }
		  return results
		}
	
	def loadTown() {
		fileName = "VermontHouse - Town.csv"
		Town curTown
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
		   curTown = new Town(map)
		   if (curTown.save()) {
			  results[curTown.town] = 'Loaded'
		   }
		   else {
			 println "Error ${map['county']}"
			 println curTown.errors.fieldErrors
			 results[curTown.town] = curTown.errors
			}
		  }
		  return results
		}
	
	def loadGnisLocale() {
		fileName = "VermontHouse - GnisLocale.csv"
		GnisLocale curGnisLocale
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
		   curGnisLocale = new GnisLocale(map)
		   if (curGnisLocale.save()) {
			  results[curGnisLocale.featureName] = 'Loaded'
		   }
		   else {
			 println "Error ${map['county']}"
			 println curGnisLocale.errors.fieldErrors
			 results[curGnisLocale.featureName] = curGnisLocale.errors
			}
		  }
		  return results
		}
	
}
