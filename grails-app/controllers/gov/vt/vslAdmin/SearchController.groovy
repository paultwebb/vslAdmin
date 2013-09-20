package gov.vt.vslAdmin
import grails.gorm.DetachedCriteria


class SearchController {

	def beforeInterceptor = {
		log.trace("Executing action $actionName with params $params from $request.locale.country")
	}
	def afterInterceptor = { model ->
		log.trace("Executed action $actionName which resulted in model: $model")
	}
    def index() { 
		//redirect(action:'loadCsv', controller:'LoadCsv')
		//redirect(url:'http://lincoln.ods.org')
		//redirect(uri:'/Town')
		//redirect(action:'show', controller:'Town',id:19)
		//[ town: Town.get(18)]
		//render('hello')
	}
	
	def shop() {
		// Page 106
		//def countyList = new DetachedCriteria(Town).distinct('county').list()
		//[counties:countyList.sort()]
		def countyList = County.list().sort{it.county}
		def townList = Town.list().sort{it.town}
		//[counties:countyList.sort()]
		return [counties:countyList,towns:townList]
		
	}
	

	def findSeat() {
		//render(params)
		def officeHolderList  = OfficeHolder.findAllBySeat(params.seat)
		println("${officeHolderList.size()}")
		if (officeHolderList) {
			//redirect(lastName:params.lastName)
			return[officeHolders:officeHolderList, officeHoldersTotal: officeHolderList.size()]
		} else {
		  // set the request variable to be used by the view
		  request.notfound = "No people with a seat of ${params.seat} found"
		  render(view:'index',model:request.notfound)
		}
	}
	
	def findPerson() {
		//render(params)
		//def personList  = Person.findAllByLastName(params.lastName)
		def personList  = Person.findAllByNameIlike('%'+params.name+'%')
		//		def personList = Person.findAll { it.lastName.toUpperCase() ==~ /.*${params.lastName()}.*/ }
		println("${personList.size()}")
		if (personList) {
			//redirect(lastName:params.lastName)
			return[people:personList]
		} else {
		  // set the request variable to be used by the view
		  request.notfound = "No people with the name of ${params.name} found"
		  render(view:'index',model:request.notfound)
		}
	}
}
