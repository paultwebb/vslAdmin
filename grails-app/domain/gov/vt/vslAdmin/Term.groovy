package gov.vt.vslAdmin
// OBSOLETE
class Term {

	// PROPERTIES
	Integer seat
	String party
	java.sql.Timestamp startDate
	java.sql.Timestamp endDate
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
//	static belongsTo = [
//		representative:Person,
//		session:Session,
//		district:District
//		]
	
	
	// CONSTRAINTS
    static constraints = {
	//	representative ()
		seat (blank:false)
		party (blank:false, inList:["R","D","I","P","O"])
		startDate(nullable:true)
		endDate(nullable:true)
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${representative.name}"
	}
}
