package gov.vt.vslAdmin

class Session {

	// PROPERTIES
	Integer code
	String session
	java.sql.Timestamp startDate
	java.sql.Timestamp endDate
	

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static hasMany = [terms:Term]
	
	
	// CONSTRAINTS
    static constraints = {
		code (blank:false, unique:true, maxSize:10)
		session (blank:false, unique:true, maxSize:100)
		startDate(nullable:true)
		endDate(nullable:true)		
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${session}"
	}
}
