package gov.vt.vslAdmin

class Office {

	//PROPERTIES
	String officeCode
	String office
	String description
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	// County -> Town[]
	static hasMany = [termsOfOffice:TermOfOffice,
		              sessions:Session,
					  districts:District]
	
	static belongsTo = [branch:Branch]
	
	// CONSTRAINTS
    static constraints = {
    	officeCode (blank:false, unique:true, maxSize:5)
		office (blank:false, unique:true, maxSize:25)
		description(nullable:true, maxSize:100 )	
		branch (blank:false)
	}
	
	// MAPPING
	static mapping = {
	//id(column:county_Id)
	}
	
	// METHODS
	String toString() {
		//return "County: code=${code}, county=${county}, countySeat=${countySeat}"
		return office
	}
}
