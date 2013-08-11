package gov.vt.vermontHouse.web

//import vermonthouse.LoadCsvService

class LoadCsvController {

	def loadCsvService
	
	def index() {
		redirect(action:'loadCsv')
	}
	
	def loadCsv() {
		render 'Replaced by Groovy script for now'
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
