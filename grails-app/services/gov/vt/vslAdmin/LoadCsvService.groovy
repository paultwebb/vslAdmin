package gov.vt.vslAdmin

//import gov.vt.vslAdmin.*

import org.grails.plugins.csv.CSVMapReader

class LoadCsvService {

	def DataSource
	String filePath = "data"
	String fileName
	Integer deletes
	Integer loads
	Integer errors
	
	def loadDistricts() {
		// Load the District table
		deletes=District.executeUpdate('delete District')
		loads = 0;errors = 0
		fileName = "VermontHouse - District.csv"
		District curDistrict
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
			curDistrict = new District(map)
			if (!curDistrict.save()) {
				println "Error ${map['district']}"
				results[curDistrict.district] = curDistrict.errors
				errors++
			} else {
				loads++
			}
		}
		println "   ${deletes} deleted. ${loads} loaded. ${errors} errors."
		return ['table':'District','deletes':deletes,'loads':loads,'errors':errors]
	}
	
	def loadCommittees() {
		// Load the Committee table
		deletes=Committee.executeUpdate('delete Committee')
		loads = 0;errors = 0
		fileName = "VermontHouse - Committee.csv"
		Committee curCommittee
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
			curCommittee = new Committee(map)
			if (!curCommittee.save()) {
				println "Error ${map['committee']}"
				results[curCommittee.committee] = curCommittee.errors
				errors++
			} else {
				loads++
			}
		}
		println "   ${deletes} deleted. ${loads} loaded. ${errors} errors."
		return ['table':'Committee','deletes':deletes,'loads':loads,'errors':errors]
	}
	
	def loadGnisLocales() {
		// Load the GNIS Locale table
		deletes=Committee.executeUpdate('delete GnisLocale')
		loads = 0;errors = 0
		fileName = "VermontHouse - GnisLocale.csv"
		GnisLocale curGnisLocale
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
			curGnisLocale = new GnisLocale(map)
			if (!curGnisLocale.save()) {
				println "Error ${map['featureName']}"
				results[curGnisLocale.featureName] = curGnisLocale.errors
				errors++
			} else {
				loads++
			}
		}
		println "   ${deletes} deleted. ${loads} loaded. ${errors} errors."
		return ['table':'GnisLocale','deletes':deletes,'loads':loads,'errors':errors]
		
	}
	
def loadCounties() {
    // Get the Counties
	deletes=Committee.executeUpdate('delete County')
    loads = 0;errors = 0
	
	def counties = GnisLocale.findAllByFeatureNameLike('% County')
	println "Size: ${counties.size}"
	def results = [:]
    counties.each { it ->
        def curCounty = new County(
                gnisId: it.gnisId,
                county: it.featureName.replaceAll(' County','')
                )
        if  (!curCounty.save()) {
            println "Error loading county: ${it.county}: ${curCounty.errors}"
			results[curCounty.county] = curCounty.errors
            errors++
        } else {
            loads++
        }
    }
    println "   ${deletes} deleted. ${loads} loaded. ${errors} errors."
	return ['table':'County','deletes':deletes,'loads':loads,'errors':errors]
	
}
def loadTowns() {
	deletes=Town.executeUpdate('delete Town')
	loads = 0;errors = 0
	// Get the Cities
	def cities = GnisLocale.findAllByFeatureNameLike('City of %')
	cities.each { it ->
		def curTown = new Town(
				gnisId: it.gnisId,
				town: it.featureName.replaceAll('City of ',''),
				entityType: 'City',
				county:County.findByCounty(it.county)
				)
		if  (!curTown.save()) {
			println "Error loading city: ${it.featureName}: ${curTown.errors}"
			results[curTown.town] = curTown.errors
			errors++
		} else {
			loads++
		}
	}
	
	// Get the Towns/Gores
	String eType
	def towns = GnisLocale.executeQuery("FROM GnisLocale WHERE featureName Like 'Town of %' OR featureName like '%Gore' OR featureName like '%Grant'" )
	towns.each { it ->
		if (it.featureName.startsWith('Town of ')) {
			eType = 'Town'
		} else {
			eType = 'Gore'
		}

		def curTown = new Town(
				gnisId: it.gnisId,
				town: it.featureName.replaceAll('Town of ',''),
				entityType: eType,
				county:County.findByCounty(it.county)
				)
		if  (!curTown.save()) {
			// try loading with Town suffix in case there's already a city
			curTown = new Town(
					gnisId: it.gnisId,
					town: it.featureName.replaceAll('Town of ','') + " Town",
					entityType: eType,
					county:County.findByCounty(it.county)
					)
			if  (!curTown.save()) {
				println "Error loading town: ${it.featureName}: ${curTown.errors}"
				results[curTown.town] = curTown.errors
				errors++
			} else {
				loads++
			}
		 } else {
		 loads++
		}
	 }
	
    println "   ${deletes} deleted. ${loads} loaded. ${errors} errors."
	return ['table':'Town','deletes':deletes,'loads':loads,'errors':errors]
}
	
}
