package gov.vt.vslAdmin
import gov.vt.vslAdmin.Term
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
	
	def findRep() {
		//render(params)
		def term  = Term.findBySeat(params.seat)
		if (term) {
			redirect(action:'show', controller:'Term',id:term.id)
			// render("${term.seat} ${term.representative} (${term.party}) ${term.session} ${term.district} ")
		} else {
		  // set the request variable to be used by the view
		  request.notfound = "Representative seat/plate ${params.seat} not found"
		  // redirect back to the search page
		  render(view:'index',model:request.notfound)
		  // return [request.notfound] // this would go to findRes.gsp
		}
	}
	
	def findPerson() {
		//render(params)
		def person  = Person.findByLastName(params.lastName)
		if (person) {
			redirect(action:'list', controller:'Person')
		} else {
		  // set the request variable to be used bby the view
		  request.notfound = "No people with the last name of ${params.lastName} found"
		  render(view:'index',model:request.notfound)
		}
	}
}
