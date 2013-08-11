package gov.vt.vslAdmin.db

class County {

	//PROPERTIES
	Integer gnisId	
	String county
	Integer created
	String formedFrom
	String etymology
	Integer population
	Integer squareMiles
	//String countySeat
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	// County -> Town[]
	static hasMany = [towns:Town]
	
	//static belongsTo = [countySeat:Town]
	
	// CONSTRAINTS
    static constraints = {
		gnisId(blank:false, unique:true)
		county (nullable:true, unique:true, maxSize:25)
		population(nullable:true)
		squareMiles(nullable:true)
		created(nullable:true, maxSize:4)
		formedFrom(nullable:true, maxSize:200)
		etymology(nullable:true, maxSize:200)

		//countySeat(nullable:true)
		}
	
	// MAPPING
	static mapping = {
	//id(column:county_Id)
	}
	
	// METHODS
	String toString() {
		//return "County: code=${code}, county=${county}, countySeat=${countySeat}"
		return county
	}
}
