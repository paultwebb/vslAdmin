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
	
	static belongsTo = [ office:Office]
	
	// CONSTRAINTS
    static constraints = {
		office (blank:false)
		districtCode (blank:false, unique:true, maxSize:3)
		district (blank:false, maxSize:50)
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
