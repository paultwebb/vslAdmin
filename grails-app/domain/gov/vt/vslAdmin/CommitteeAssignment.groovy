package gov.vt.vslAdmin

class CommitteeAssignment {

	// PROPERTIES
	String role

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static belongsTo = [
		representative:Person,
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
