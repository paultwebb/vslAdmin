package gov.vt.vslAdmin

class District {

	// PROPERTIES
	Integer districtCode
	String district
	Integer members 
	String districtImage
	String townList
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static hasMany = [
		officeHolders:OfficeHolder]
	
	// CONSTRAINTS
    static constraints = {
		districtCode (blank:false, unique:true, maxSize:3)
		district (blank:false, unique:true, maxSize:50)
		members (nullable:true)
		townList (nullable:true,maxSize:250)
		districtImage (nullable:true,maxSize:100)
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${district}"
	}
}
