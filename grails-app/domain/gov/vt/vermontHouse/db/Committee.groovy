package gov.vt.vermontHouse.db

class Committee {

	// PROPERTIES
	Integer code
	String committee
	String room 

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static hasMany = [committeeAssignments:CommitteeAssignment]
	
	
	// CONSTRAINTS
    static constraints = {
		code (blank:false, unique:true, maxSize:10)
		committee (blank:false, unique:true, maxSize:100)
		room (nullable:true, maxSize:20)
		
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${committee}"
	}
}
