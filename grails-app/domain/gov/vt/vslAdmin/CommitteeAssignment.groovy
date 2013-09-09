package gov.vt.vslAdmin

class CommitteeAssignment {

	// PROPERTIES
	String role

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static belongsTo = [
		person:Person,
		committee:Committee
	]
	
	
	// CONSTRAINTS
    static constraints = {
		committee (blank:false)
		person (blank:false)
		role (nullable:true, maxSize:20)		
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${committee.committee}: ${person.name} ${role}"
	}
}
