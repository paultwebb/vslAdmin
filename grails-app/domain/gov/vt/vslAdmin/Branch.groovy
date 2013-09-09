package gov.vt.vslAdmin

class Branch {

	//PROPERTIES
	String branchCode
	String branch
	String description
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static hasMany = [offices:Office]
	
	//static belongsTo = [countySeat:Town]
	
	// CONSTRAINTS
    static constraints = {
		branchCode (blank:false, unique:true, maxSize:5)		
		branch (blank:false, unique:true, maxSize:25)
		description(nullable:true, maxSize:100 )		}
	
	// MAPPING
	static mapping = {
	//id(column:county_Id)
	}
	
	// METHODS
	String toString() {
		//return "County: code=${code}, county=${county}, countySeat=${countySeat}"
		return branch
	}
}
