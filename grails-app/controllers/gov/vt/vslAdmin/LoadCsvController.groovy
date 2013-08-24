package gov.vt.vslAdmin
import gov.vt.vslAdmin.County

//import vslAdmin.LoadCsvService

class LoadCsvController {

	def loadCsvService
	
	def index() {
		redirect(action:'loadCsv')
	}
	
	def loadCsv() {
		log.info('loadCsv action')
		render 'Replaced by Groovy script for now..'
//		render text:'<county>Addison</county>', contentType:'text/xml'
//		try {
//			def x = 1/0
//		} catch (Exception e) {
//		  log.error ('hmm, an error. just kidding, it was forced')
//		}
//		redirect url : "http://lincoln.ods.org" 
	    [ county: County.get(params.county)]
		}
	
    def loadCounty() { 
		render 'Loading Counties<P>'
		def results = loadCsvService.loadCounty()
		println "results:${results}"
		
	 results.each { result ->
			render "${result}<BR>"
		}
	}
	
	def loadTown() {
		render 'Loading Towns<P>'
		def results = loadCsvService.loadTown()
		println "results:${results}"
		
	 results.each { result ->
			render "${result}<BR>"
		}
	}
	
	def loadGnisLocale() {
		render 'Loading Locales<P>'
		def results = loadCsvService.loadGnisLocale()
		println "results:${results}"
		
	 results.each { result ->
			render "${result}<BR>"
		}
	}
	
}
