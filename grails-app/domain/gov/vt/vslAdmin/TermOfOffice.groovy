package gov.vt.vslAdmin

class TermOfOffice {

	// PROPERTIES
	String termOfOfficeCode
	String termOfOffice
	String description
	
	java.sql.Timestamp startDate
	java.sql.Timestamp endDate

	java.sql.Timestamp dateCreated
	java.sql.Timestamp lastUpdated
	
	// RELATIONSHIP PROPERTIES
	static hasMany = [officeHolders:OfficeHolder,
		              sessions:Session]
	
	static belongsTo = [office:Office]
	
	
	// CONSTRAINTS
    static constraints = {
		termOfOfficeCode (blank:false, unique:true, maxSize:10)
		termOfOffice (blank:false, unique:true, maxSize:50)
		description(nullable:true, maxSize:100)
		office(blank:false)
		startDate(blank:false)
		endDate(blank:false)		
		}
	
	// MAPPING
	static mapping = {
	}
	
	// METHODS
	String toString() {
		return termOfOffice
	}
}
