package gov.vt.vslAdmin

class Party {

	// PROPERTIES
	String partyCode
	String party
	String description

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static hasMany = [officeHoldings:OfficeHolder,
					  people:Person]
	
	
	// CONSTRAINTS
    static constraints = {
		partyCode (blank:false, unique:true, maxSize:5)
		party (blank:false, unique:true, maxSize:20)
		description(nullable:true, maxSize:100)
	}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${party}"
	}
}
