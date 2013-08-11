import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import gov.vt.vslAdmin.db.Session
import gov.vt.vslAdmin.db.GnisLocale
import gov.vt.vslAdmin.db.County
import gov.vt.vslAdmin.db.Town
import gov.vt.vslAdmin.db.District
import gov.vt.vslAdmin.db.Representative
import gov.vt.vslAdmin.db.Committee
import gov.vt.vslAdmin.db.CommitteeAssignment
import gov.vt.vslAdmin.db.Term


import org.grails.plugins.csv.CSVMapReader

String filePath = "/Users/paulw/Downloads"
String fileName
Integer loads
Integer errors

def loadSessions() {
    println 'Loading Sessions'
    loads = 0;errors = 0
    def s2013 = new Session(
            code:2013,
            session:"2013-2014 Legislative Session",
            startDate:Timestamp.valueOf('2013-01-10 00:00:00.0'),
            endDate:Timestamp.valueOf('2014-05-31 00:00:00.0')
            //startDate:Date.parse('MM/dd/yyyy','01/15/2013')
            )
    if (!s2013.save()) {
        println s2013.errors.fieldErrors
        errors++
    } else {
        loads++
    }
    println "   ${loads} loaded. ${errors} errors."
}


def loadGnisLocales() {
    // Load the GNIS Locale table
    println 'Loading GNIS Locales'
    loads = 0;errors = 0
    String filePath = "/Users/paulw/Downloads"
    fileName = "VermontHouse - GnisLocale.csv"
    GnisLocale curGnisLocale
    def reader = new File("${filePath}/${fileName}").toCsvMapReader()
    def results = [:]
    reader.each { map ->
        curGnisLocale = new GnisLocale(map)
        if (!curGnisLocale.save()) {
            println "Error ${map['featureName']}"
            println curGnisLocale.errors.fieldErrors
            results[curGnisLocale.featureName] = curGnisLocale.errors
            errors++
        } else {
            loads++
        }
    }
    println "   ${loads} loaded. ${errors} errors."
}


def loadCounties() {
    // Get the Counties
    println 'Loading Counties'
    loads = 0;errors = 0
    def counties = GnisLocale.findAllByFeatureNameLike('% County')
    // println counties

    counties.each { it ->
        def county = new County(
                gnisId: it.gnisId,
                county: it.featureName.replaceAll(' County','')
                )
        if  (!county.save()) {
            println "Error loading county: ${it.county}: ${county.errors}"
            errors++
        } else {
            loads++
        }
    }
    println "   ${loads} loaded. ${errors} errors."
}


def loadCities() {
    // Get the Cities
    println 'Loading Cities'
    loads = 0;errors = 0
    cities = GnisLocale.findAllByFeatureNameLike('City of %')
    // println cities

    cities.each { it ->
       //     println it.county;
        def town = new Town(
                gnisId: it.gnisId,
                town: it.featureName.replaceAll('City of ',''),
                entityType: 'City',
                county:County.findByCounty(it.county)                
                )
        if  (!town.save()) {
            println "Error loading city: ${it.featureName}: ${town.errors}"
            errors++
        } else {
            loads++
        }
    }
    println "   ${loads} loaded. ${errors} errors."
}


def loadTowns() {
    // Get the Towns
    String eType
    println 'Loading Towns/Gores'
    loads = 0;errors = 0
    // towns = GnisLocale.findAllByFeatureNameLike('Town of %')
    towns = GnisLocale.executeQuery("FROM GnisLocale WHERE featureName Like 'Town of %' OR featureName like '%Gore' OR featureName like '%Grant'" )
    // println towns

    towns.each { it ->
        if (it.featureName.startsWith('Town of ')) {
            eType = 'Town'
        } else {
            eType = 'Gore'
        }

        def town = new Town(
                gnisId: it.gnisId,
                town: it.featureName.replaceAll('Town of ',''),
                entityType: eType,
                county:County.findByCounty(it.county)    
                )
        if  (!town.save()) {
            // try loading with Town suffix in case there's already a city
            town = new Town(
                    gnisId: it.gnisId,
                    town: it.featureName.replaceAll('Town of ','') + " Town",
                    entityType: eType
                    )
            if  (!town.save()) {
                println "Error loading town: ${it.featureName}: ${town.errors}"
                errors++
            } else {
                loads++
            }
         } else {
         loads++
        }
     }
     println "   ${loads} loaded. ${errors} errors."
}

def loadDistricts() {
    // Load the District table
    println 'Loading Districts'
    loads = 0;errors = 0
    fileName = "VermontHouse - District.csv"
    String filePath = "/Users/paulw/Downloads"
    District curDistrict
    def reader = new File("${filePath}/${fileName}").toCsvMapReader()
    def results = [:]
    reader.each { map ->
        curDistrict = new District(map)
        if (!curDistrict.save()) {
            println "Error ${map['district']}"
            println curDistrict.errors.fieldErrors
            results[curDistrict.district] = curDistrict.errors
            errors++
        } else {
            loads++
        }
    }
    println "   ${loads} loaded. ${errors} errors."
}


def loadRepresentatives() {
    // Load the Representative table
    println 'Loading Representatives'
    loads = 0;errors = 0
    fileName = "VermontHouse - Representative.csv"
    String filePath = "/Users/paulw/Downloads"
    Representative curRepresentative
    def reader = new File("${filePath}/${fileName}").toCsvMapReader()
    def results = [:]
    reader.each { map ->
        curRepresentative = new Representative(map)
        if (!curRepresentative.save()) {
            println "Error ${map['name']}"
            println curRepresentative.errors.fieldErrors
            results[curRepresentative.name] = curRepresentative.errors
            errors++
        } else {
            loads++
        }
    }
    println "   ${loads} loaded. ${errors} errors."
}


def loadCommittees() {
    // Load the Committee table
    println 'Loading Committees'
    loads = 0;errors = 0
    fileName = "VermontHouse - Committee.csv"
    String filePath = "/Users/paulw/Downloads"
    Committee curCommittees
    def reader = new File("${filePath}/${fileName}").toCsvMapReader()
    def results = [:]
    reader.each { map ->
        // println map
        curCommittee = new Committee(map)
        if (!curCommittee.save()) {
            println "Error ${map['committee']}"
            println curCommittee.errors.fieldErrors
            results[curCommittee.committee] = curCommittee.errors
            errors++
        } else {
            loads++
        }
    }
    println "   ${loads} loaded. ${errors} errors."
}

def loadCommitteeAssignments() {
    // Load the Assignments table
    println 'Loading Assignments'
    loads = 0;errors = 0
    fileName = "VermontHouse - Assignment.csv"
    String filePath = "/Users/paulw/Downloads"
    CommitteeAssignment curCommitteeAssignment
    def reader = new File("${filePath}/${fileName}").toCsvMapReader()
    def results = [:]
    reader.each { map ->
        //println map
        curCommitteeAssignment = new CommitteeAssignment(
                committee:Committee.findByCode(map.committeeCode),
                representative:Representative.findByRepId(map.repId),
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
     println "   ${loads} loaded. ${errors} errors."
}


def loadTerms() {
    // Load the Terms table from the reps table
    println 'Loading Terms'
    loads = 0;errors = 0
    fileName = "VermontHouse - Representative.csv"
    String filePath = "/Users/paulw/Downloads"
    Term curTerm
    def reader = new File("${filePath}/${fileName}").toCsvMapReader()
    def results = [:]
    reader.each { map ->
        // println map
        curTerm = new Term (
                seat:map.currentSeat,
                session:Session.findByCode(2013),
                representative:Representative.findByRepId(map.repId),
                district:District.findByDistrict(map.district),
                party:map.currentParty,
                startDate:Timestamp.valueOf('2012-11-15 00:00:00.0'),
                endDate:Timestamp.valueOf('2012-11-15 00:00:00.0')
                )
        if (!curTerm.save()) {
            println "Error ${map}"
            println curTerm.errors
            results[curTerm.party] = curTerm.errors
            errors++
        } else {
            loads++
        }
    }
    println "   ${loads} loaded. ${errors} errors."
    // Adjust Warren's start date
    def wvwTerm = Term.findBySeat(11)
    wvwTerm.startDate=Timestamp.valueOf('2013-01-18 00:00:00.0')
    wvwTerm.save()

}

//---------------
// MAIN Section
//---------------

// Clear existing data


Term.executeUpdate('delete Term')
Session.executeUpdate('delete Session')
CommitteeAssignment.executeUpdate('delete CommitteeAssignment')
Representative.executeUpdate('delete Representative')
Committee.executeUpdate('delete Committee')
District.executeUpdate('delete District')
Town.executeUpdate('delete Town')
County.executeUpdate('delete County')
GnisLocale.executeUpdate('delete GnisLocale')

// Load new Data

 loadGnisLocales()
 loadCounties()
 loadCities()
 loadTowns()
 loadDistricts()
 loadCommittees()
 loadRepresentatives()

 loadCommitteeAssignments()
 loadSessions()
 loadTerms()
 
 