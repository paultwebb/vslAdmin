package gov.vt.vslAdmin

//import gov.vt.vslAdmin.*

import org.grails.plugins.csv.CSVMapReader
import java.sql.Timestamp;
//import java.sql.Date;

class LoadCsvService {

	def DataSource
	String filePath = "data"
	String fileName
	Integer deletes
	Integer loads
	Integer errors

	def loadPeople() {
		loads = 0;errors = 0
		deletes=CommitteeAssignment.executeUpdate('delete CommitteeAssignment')
		deletes=OfficeHolder.executeUpdate('delete OfficeHolder')
		deletes=Person.executeUpdate('delete Person')

		// Load the Representative file into People
		fileName = "VermontHouse - Representative.csv"
		Person curRepresentative
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
			curRepresentative = new Person(map)
			curRepresentative.currentParty = Party?.findByPartyCode(map.currentPartyCode)
			if (!curRepresentative.save()) {
			//	println "Error ${map['representative']}"
				println curRepresentative.errors
			//	results[curRepresentative.name] = curRepresentative.errors
				errors++
			} else {
				loads++
			}
			def curOfficeHolder = new OfficeHolder(map)
			curOfficeHolder.person = Person.findByPersonId(map.personId)
			curOfficeHolder.termOfOffice = TermOfOffice.findByTermOfOfficeCode("H2013")
			curOfficeHolder.party = curRepresentative.currentParty
			curOfficeHolder.district = District.findByDistrict(map.houseDistrict)
			curOfficeHolder.startDate = Timestamp.valueOf('2012-11-15 00:00:00.0')
			curOfficeHolder.endDate = Timestamp.valueOf('2012-11-15 00:00:00.0')
			if (!curOfficeHolder.save()) {
					println curOfficeHolder.errors
					errors++
				} else {
					loads++
				}
		}
		println "Representatives:   ${deletes} deleted. ${loads} loaded. ${errors} errors."

		// Load the Senator file into People
		fileName = "VermontHouse - Senator.csv"
		Person curSenator
		reader = new File("${filePath}/${fileName}").toCsvMapReader()
		results = [:]
		reader.each { map ->
			curSenator = new Person(map)
			curSenator.currentParty = Party?.findByPartyCode(map.currentPartyCode)
			
			if (!curSenator.save()) {
			//	println "Error ${map['senator']}"
				println curSenator.errors
			//	results[curSenator.name] = curSenator.errors
				errors++
			} else {
				loads++
			}
			def curOfficeHolder = new OfficeHolder(map)
			curOfficeHolder.person = Person.findByPersonId(map.personId)
			curOfficeHolder.termOfOffice = TermOfOffice.findByTermOfOfficeCode("S2013")
			curOfficeHolder.party = curSenator.currentParty
			curOfficeHolder.district = District.findByDistrict(map.senateDistrict)
			curOfficeHolder.startDate = Timestamp.valueOf('2012-11-15 00:00:00.0')
			curOfficeHolder.endDate = Timestamp.valueOf('2012-11-15 00:00:00.0')
			if (!curOfficeHolder.save()) {
					println curOfficeHolder.errors
					errors++
				} else {
					loads++
				}
		}
		println "Senators:   ${deletes} deleted. ${loads} loaded. ${errors} errors."

		// Load the Executive file into People
		fileName = "VermontHouse - Executive.csv"
		Person curExecutive
		reader = new File("${filePath}/${fileName}").toCsvMapReader()
		results = [:]
		reader.each { map ->
			curExecutive = new Person(map)
			curExecutive.currentParty = Party?.findByPartyCode(map.currentPartyCode)
			
			if (!curExecutive.save()) {
			//	println "Error ${map['senator']}"
				println curExecutive.errors
			//	results[curExecutive.name] = curExecutive.errors
				errors++
			} else {
				loads++
			}
			def curOfficeHolder = new OfficeHolder(map)
			curOfficeHolder.person = Person.findByPersonId(map.personId)
			curOfficeHolder.termOfOffice = TermOfOffice.findByTermOfOfficeCode(map.termOfOfficeCode)
			curOfficeHolder.party = curExecutive.currentParty
			curOfficeHolder.district = District.findByDistrict("Statewide")
			curOfficeHolder.startDate = Timestamp.valueOf('2012-11-15 00:00:00.0')
			curOfficeHolder.endDate = Timestamp.valueOf('2012-11-15 00:00:00.0')
			if (!curOfficeHolder.save()) {
					println curOfficeHolder.errors
					errors++
				} else {
					loads++
				}
				}
		println "Executives   ${deletes} deleted. ${loads} loaded. ${errors} errors."

		return ['table':'People','deletes':deletes,'loads':loads,'errors':errors]
	}
		
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
			curDistrict.office = Office.findByOfficeCode(map.officeCode)
			
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
	
	def loadCommitteeAssignments() {
		// Load the Assignments table
		deletes=CommitteeAssignment.executeUpdate('delete CommitteeAssignment')
		loads = 0;errors = 0
		fileName = "VermontHouse - Assignment.csv"
		CommitteeAssignment curCommitteeAssignment
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
			curCommitteeAssignment = new CommitteeAssignment(
					committee:Committee.findByCommitteeCode(map.committeeCode),
					person:Person.findByPersonId(map.personId),
					role:map.role
					)
			if (!curCommitteeAssignment.save()) {
				println "Error ${map}"
				println curCommitteeAssignment.errors.fieldErrors
				results[curCommitteeAssignment.role] = curCommitteeAssignment.errors
				errors++
			} else {
				loads++
			}
		 }
		println "   ${deletes} deleted. ${loads} loaded. ${errors} errors."
		return ['table':'CommitteeAssignment','deletes':deletes,'loads':loads,'errors':errors]
	}
	
	def loadTermsOfOffice() {
		// Load the TermOfOffice table
		deletes=Session.executeUpdate('delete Session')
		deletes=TermOfOffice.executeUpdate('delete TermOfOffice')
		loads = 0;errors = 0
		fileName = "VermontHouse - TermOfOffice.csv"
		TermOfOffice curTermOfOffice
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
			curTermOfOffice = new TermOfOffice(map)
			curTermOfOffice.office = Office?.findByOfficeCode(map.officeCode)
			curTermOfOffice.startDate = Date.parse("MM/dd/yyyy",map.startDateString).toTimestamp()
			curTermOfOffice.endDate = Date.parse("MM/dd/yyyy",map.endDateString).toTimestamp()
			if (!curTermOfOffice.save()) {
				println "Error ${map['termOfOffice']}"
				println results
				results[curTermOfOffice.termOfOffice] = curTermOfOffice.errors
				errors++
			} else {
				loads++
			}
		}
		println "   ${deletes} deleted. ${loads} loaded. ${errors} errors."
		return ['table':'TermOfOffice','deletes':deletes,'loads':loads,'errors':errors]
	}
	
	def loadSessions() {
		// Load the Session table
		deletes=Session.executeUpdate('delete Session')
		loads = 0;errors = 0
		fileName = "VermontHouse - Session.csv"
		Session curSession
		def reader = new File("${filePath}/${fileName}").toCsvMapReader()
		def results = [:]
		reader.each { map ->
			curSession = new Session(map)
			curSession.office = Office?.findByOfficeCode(map.officeCode)
			curSession.termOfOffice = TermOfOffice?.findByTermOfOfficeCode(map.termOfOfficeCode)
			curSession.startDate = Date.parse("MM/dd/yyyy",map.startDateString).toTimestamp()
			curSession.endDate = Date.parse("MM/dd/yyyy",map.endDateString).toTimestamp()
			if (!curSession.save()) {
				println "Error ${map['session']}"
				println results
				results[curSession.session] = curSession.errors
				errors++
			} else {
				loads++
			}
		}
		println "   ${deletes} deleted. ${loads} loaded. ${errors} errors."
		return ['table':'Session','deletes':deletes,'loads':loads,'errors':errors]
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
