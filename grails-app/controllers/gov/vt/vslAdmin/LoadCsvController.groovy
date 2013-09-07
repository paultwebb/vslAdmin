package gov.vt.vslAdmin
//import gov.vt.vslAdmin.County

//import vslAdmin.LoadCsvService


class LoadCsvController {

	def loadCsvService

	def beforeInterceptor = {
		log.trace("Executing action $actionName with params $params from $request.locale.country")
	}
	def afterInterceptor = { model ->
		log.trace("Executed action $actionName which resulted in model: $model")
	}
		
	def index() {
		//redirect(action:'loadCsv')
		//loadCsvService.loadDistricts()
		log.trace("in index")
		redirect(action:'loadCsv')	
			}

	def loadDistrict() {
		def results = loadCsvService.loadDistricts()
		redirect(action:'loadCsv', params:results)
	}
	
	def loadRepresentative() {
		def results = loadCsvService.loadRepresentatives()
		redirect(action:'loadCsv', params:results)
	}
	def loadSenator() {
		def results = loadCsvService.loadSenators()
		redirect(action:'loadCsv', params:results)
	}


	def loadCommittee() {
		def results = loadCsvService.loadCommittees()
		redirect(action:'loadCsv', params:results)
	}

	def loadGnisLocale() {
		def results = loadCsvService.loadGnisLocales()
		redirect(action:'loadCsv', params:results)
	}
			
	def loadCounty() {
		def results = loadCsvService.loadCounties() 	
		redirect(action:'loadCsv', params:results)		
	}
	
	def loadTown() {
		def results = loadCsvService.loadTowns()
		redirect(action:'loadCsv', params:results)
	}
		
	def loadCsv() {
		//log.info('loadCsv action.0')
		render(view:'loadCsv', model:params)
		//log.info('loadCsv action.1')
		
//		render 'Replaced by Groovy script for now..'
//		render text:'<county>Addison</county>', contentType:'text/xml'
//		try {
//			def x = 1/0
//		} catch (Exception e) {
//		  log.error ('hmm, an error. just kidding, it was forced')
//		}
//		redirect url : "http://lincoln.ods.org" 
//	    [ county: County.get(params.county)]
		}
	

	

	

	
}
