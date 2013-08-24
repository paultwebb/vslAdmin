package gov.vt.vslAdmin
import gov.vt.vslAdmin.Term


class SearchController {

	
    def index() { 
		//redirect(action:'loadCsv', controller:'LoadCsv')
		//redirect(url:'http://lincoln.ods.org')
		//redirect(uri:'/Town')
		//redirect(action:'show', controller:'Town',id:19)
		//[ town: Town.get(18)]
		//render('hello')
	}
	
	def findRep() {
		//render(params)
		def term  = Term.findBySeat(params.seat)
		if (term) {
			redirect(action:'show', controller:'Term',id:term.id)
			// render("${term.seat} ${term.representative} (${term.party}) ${term.session} ${term.district} ")
		} else {
		  render("Seat ${params.seat} not found")
		}
	}
}
