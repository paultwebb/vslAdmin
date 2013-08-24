package gov.vt.vslAdmin

class GnisLocale {

	//PROPERTIES
	Integer gnisId
	String featureName
	String gnisClass
	String county
	String state
	String latitude
	String longitude
	Integer elevation
	String map
//	java.sql.Date bgnDate
//	java.sql.Date entryDate
	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated

	// RELATIONSHIP PROPERTIES


	// CONSTRAINTS
	static constraints = {
		featureName (blank:false)
		county  (blank:false)
		gnisClass  (blank:false)
		longitude  (blank:false)
		latitude  (blank:false)
		elevation (nullable:true)
		gnisId (blank:false, unique:true)
	}

	// MAPPING
	static mapping = {
	}

	// METHODS
	String toString() {
		return featureName
	}
}


