package gov.vt.vslAdmin

class Representative extends Person {

	Integer currentSeat
	String currentParty
	String firstTerm
	

	// RELATIONSHIP PROPERTIES
	static hasMany = [
		committeeAssignments:CommitteeAssignment,
		terms:Term]
	
	// CONSTRAINTS
	static constraints = {
		currentSeat (nullable:true, unique:true, maxSize:3)
		currentParty (blank:false, inList:["R","D","I","P","O"])
		firstTerm (nullable:true, maxSize:1)
	}
}