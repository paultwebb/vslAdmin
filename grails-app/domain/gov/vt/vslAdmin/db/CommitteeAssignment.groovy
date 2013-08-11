package gov.vt.vslAdmin.db

class CommitteeAssignment {

	// PROPERTIES
	String role

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static belongsTo = [
		representative:Representative,
		committee:Committee
	]
	
	
	// CONSTRAINTS
    static constraints = {
		committee (blank:false)
		representative (black:false)
		role (nullable:true, maxSize:20)		
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${committee.committee}: ${representative.name} ${role}"
	}
}
