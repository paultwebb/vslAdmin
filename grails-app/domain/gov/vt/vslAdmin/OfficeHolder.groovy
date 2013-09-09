package gov.vt.vslAdmin

class OfficeHolder {

	// PROPERTIES
	Integer seat
	String notes
	
	java.sql.Timestamp startDate
	java.sql.Timestamp endDate

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	//static hasMany = [committeeAssignments:CommitteeAssignment]
	
	static belongsTo = [termOfOffice:TermOfOffice,
	                    person:Person,
						party:Party,
						district:District]
	
	
	// CONSTRAINTS
    static constraints = {
		person(blank:false)
		seat(nullable:true)
		termOfOffice(blank:false)
		party(nullable:true)
		district(nullable:true)
		notes(nullable:true, maxSize:100)
		startDate(blank:false)
		endDate(blank:false)		
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${termOfOffice} : ${person}"
	}
}
