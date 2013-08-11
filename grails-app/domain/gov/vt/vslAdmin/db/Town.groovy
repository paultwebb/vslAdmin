package gov.vt.vslAdmin.db

class Town {

	// PROPERTIES
	Integer gnisId
	String town
	String entityType 
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	// Town -> County	
	static belongsTo = [county:County]
	//static hasOne = [countySeat:County]
	
	// CONSTRAINTS
    static constraints = {
		gnisId (blank:false, unique:true)
		town (blank:false, unique:true, maxSize:25)
    	entityType (blank:false, inList:["Town","City","Gore"])
		county (nullable:true)
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return "${town}"
	}
	
}
