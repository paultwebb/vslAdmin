import gov.vt.vslAdmin.User
import gov.vt.vslAdmin.Office
import gov.vt.vslAdmin.Branch
import gov.vt.vslAdmin.Committee
import gov.vt.vslAdmin.CommitteeAssignment;
import gov.vt.vslAdmin.District
import gov.vt.vslAdmin.Session
import gov.vt.vslAdmin.Office
import gov.vt.vslAdmin.Person;
import gov.vt.vslAdmin.TermOfOffice
import gov.vt.vslAdmin.OfficeHolder
import gov.vt.vslAdmin.Party
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

class BootStrap {
	
    def init = { servletContext ->

		if (!User.count()) {
			new User(login:"admin", password:"admin", firstName:"Admin", 
				lastName:"User").save(failOnError: true)
		}
		
		if (!Party.count()) {
			new Party(partyCode:"D",party:"Democrat").save(failOnError: true)
			new Party(partyCode:"R",party:"Republican").save(failOnError: true)
			new Party(partyCode:"I",party:"Independent").save(failOnError: true)
			new Party(partyCode:"P",party:"Progressive").save(failOnError: true)
			new Party(partyCode:"DP",party:"Dem/Prog").save(failOnError: true)
			new Party(partyCode:"PDW",party:"Prog/Dem/Wig").save(failOnError: true)		
		}

		if (!Branch.count()) {
			new Branch(branchCode:"LEG",branch:"Legislature", description:"").save(failOnError: true)
			new Branch(branchCode:"EXEC",branch:"Executive", description:"").save(failOnError: true)
			new Branch(branchCode:"JUD",branch:"Judicial", description:"").save(failOnError: true)
			new Branch(branchCode:"OTHER",branch:"Other", description:"eg. PSB").save(failOnError: true)
		}
		
		if (!District.count()) {
			new District(districtCode:"1",district:"Addison -1",members:1,townList:"Ferrisburgh, Vergennes").save(failOnError: true)
		}
		
		if (!Office.count()) {
			new Office(officeCode:"SEN",office:"Senator", description:"2 year term",branch:Branch.findByBranchCode("LEG")).save(failOnError: true)
			new Office(officeCode:"REP",office:"Representative", description:"2 year term",branch:Branch.findByBranchCode("LEG")).save(failOnError: true)
			new Office(officeCode:"GOV",office:"Governor", description:"2 year term",branch:Branch.findByBranchCode("EXEC")).save(failOnError: true)
			new Office(officeCode:"LGOV",office:"Lieutenant Governor", description:"2 year term",branch:Branch.findByBranchCode("EXEC")).save(failOnError: true)
			new Office(officeCode:"AG",office:"Attorney General", description:"2 year term",branch:Branch.findByBranchCode("OTHER")).save(failOnError: true)
			new Office(officeCode:"SC",office:"Supreme Court", description:"Lifetime appointment",branch:Branch.findByBranchCode("JUD")).save(failOnError: true)
		}
/*		
		if (!TermOfOffice.count()) {
			new TermOfOffice(termOfOfficeCode:"H2013",termOfOffice:"House 2013-14 Term",description:"House 2013-14 Term",
				startDate:Timestamp.valueOf('2013-01-10 00:00:00.0'),
				endDate:Timestamp.valueOf('2014-01-09 00:00:00.0'),
				office:Office.findByOfficeCode("REP")).save(failOnError: true)
		}
		
		if (!Session.count()) {
			new Session(sessionCode:"H2013",session:"House 2013-14 Session",description:"House 2013-14 Legisative Session",
				startDate:Timestamp.valueOf('2013-01-15 00:00:00.0'),
				endDate:Timestamp.valueOf('2014-05-15 00:00:00.0'),
				office:Office.findByOfficeCode("REP"),
				termOfOffice:TermOfOffice.findByTermOfOfficeCode("H2013")).save(failOnError: true)
		}

		if (!Person.count()) {
			new Person(personId:138,name:"Warren Van Wyck",
				lastName:"Van Wyck",firstName:"Warren",
			    currentParty:Party.findByPartyCode("R")).save(failOnError: true).save(failOnError: true)
		}
		
		if (!OfficeHolder.count()) {
			new OfficeHolder(
				termOfOffice:TermOfOffice.findByTermOfOfficeCode("H2013"),
				startDate:Timestamp.valueOf('2013-01-18 00:00:00.0'),
				endDate:Timestamp.valueOf('2014-05-15 00:00:00.0'),
				party:Party.findByPartyCode("R"),
				seat:11,
				district:District.findByDistrictCode("1"),
				person:Person.findByPersonId(138)).save(failOnError: true)
		}
		
	   	if (!Committee.count()) {
			   new Committee(
				   committeeCode:"1",
				   committee:"Joint Committee on Committees",
				   scope:"J",
				   description:"Committee making",
				   room:"1").save(failOnError: true)
		   }
		   
		 if (!CommitteeAssignment.count()) {
			 new CommitteeAssignment(
				 committee:Committee.findByCommitteeCode("1"),
				 person:Person.findByPersonId(138),
				 role:"Chair").save(failOnError: true)
		 }
*/
    }	
	
    def destroy = {
    }
}
