package gov.vt.vslAdmin

class Session {

	// PROPERTIES
	String sessionCode
	String session
	String description
	
	java.sql.Timestamp startDate
	java.sql.Timestamp endDate
	

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
//	static hasMany = [term:Term]
	static belongsTo = [office:Office,
		                termOfOffice:TermOfOffice]
	
	
	// CONSTRAINTS
    static constraints = {
		sessionCode (blank:false, unique:true, maxSize:10)
		session (blank:false, unique:true, maxSize:50)
		description(nullable:true, maxSize:100)
		office(blank:false)
		termOfOffice(blank:false)
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
