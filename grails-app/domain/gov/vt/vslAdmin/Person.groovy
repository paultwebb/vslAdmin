package gov.vt.vslAdmin

class Person {

	// PROPERTIES
	Integer personId

	String name
	String lastName
	String firstName
	String middleName
	String preferredName
	String homeTown
	String birthTown
	String birthState
	String birthCountry
	Integer birthMonth
	Integer birthDay
	Integer birthYear
	String phoneOffice
	String phoneCell
	String phoneHome
	String address1
	String address2
	String city
	String state
	String zip
//	String district
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	//static hasMany = [
	//	committeeAssignments:CommitteeAssignment,
	//	terms:Term]
	
	// CONSTRAINTS
    static constraints = {
		 name (blank:false, maxSize:50)
		 homeTown (nullable:true, maxSize:40)
		 personId (blank:false, unique:true, maxSize:3)
		 lastName (blank:false, maxSize:30)
		 firstName (blank:false, maxSize:30)
		 middleName (nullable:true, maxSize:30)
		 preferredName (nullable:true, maxSize:50)
		 birthTown (nullable:true, maxSize:30)
		 birthState (nullable:true, maxSize:2)
		 birthCountry (nullable:true, maxSize:30)
		 birthMonth (nullable:true, maxSize:2)
		 birthDay (nullable:true, maxSize:2)
		 birthYear (nullable:true, maxSize:4)
		 phoneOffice (nullable:true, maxSize:15)
		 phoneCell (nullable:true, maxSize:15)
		 phoneHome (nullable:true, maxSize:15)
		 address1 (nullable:true, maxSize:50)
		 address2 (nullable:true, maxSize:50)
		 city (nullable:true, maxSize:30)
		 state (nullable:true, maxSize:2)
		 zip (nullable:true, maxSize:10)
		}
	
	// MAPPING
	static mapping = {
		tablePerHierarchy false
	}
	
	
	// METHODS
	String toString() {
		return "${name}"
	}
}
