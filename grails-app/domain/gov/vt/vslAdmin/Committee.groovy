package gov.vt.vslAdmin

class Committee {

	// PROPERTIES
	String committeeCode
	String committee
	String scope
	String description
	String room 

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static hasMany = [committeeAssignments:CommitteeAssignment]
	
	
	// CONSTRAINTS
    static constraints = {
		committeeCode (blank:false, unique:true, maxSize:10)
		committee (blank:false, unique:true, maxSize:60)
		scope(nullable:true, maxSize:20)
		room (nullable:true, maxSize:20)
		description(nullable:true, maxSize:100)
	}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${committee}"
	}
}
