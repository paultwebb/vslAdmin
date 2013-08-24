package gov.vt.vslAdmin

import org.grails.plugin.filterpane.FilterPaneUtils

//import gov.vt.vslAdmin.GnisLocale;

import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.filterpane.FilterPaneUtils

class GnisLocaleController {
	
	def filterPaneService
	def filterService
	
	def index() {
		redirect(action: "list", params: params)
	}

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def list(Integer max) {
		params.max = Math.min(max ?: 20, 100)
		//[gnisLocaleInstanceList: GnisLocale.list(params), gnisLocaleInstanceTotal: GnisLocale.count()]
		//[ gnisLocaleList: GnisLocale.list( params ), filterParams: FilterPaneUtils.extractFilterParams(params) ]
		[ gnisLocaleInstanceList: GnisLocale.list( params ), filterParams: FilterPaneUtils.extractFilterParams(params) ]
		
				
			}
	
	def filter = {
		if(!params.max) params.max = 10
		render( view:'list',
			model:[ gnisLocaleInstanceList: filterPaneService.filter( params, GnisLocale ),
			gnisLocaleInstanceCount: filterPaneService.count( params, GnisLocale ),
			filterParams: FilterPaneUtils.extractFilterParams(params),
			params:params ] )
	}


    def create() {
        [gnisLocaleInstance: new GnisLocale(params)]
    }

    def save() {
        def gnisLocaleInstance = new GnisLocale(params)
        if (!gnisLocaleInstance.save(flush: true)) {
            render(view: "create", model: [gnisLocaleInstance: gnisLocaleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gnisLocale.label', default: 'GnisLocale'), gnisLocaleInstance.id])
        redirect(action: "show", id: gnisLocaleInstance.id)
    }

    def show(Long id) {
        def gnisLocaleInstance = GnisLocale.get(id)
        if (!gnisLocaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gnisLocale.label', default: 'GnisLocale'), id])
            redirect(action: "list")
            return
        }

        [gnisLocaleInstance: gnisLocaleInstance]
    }

    def edit(Long id) {
        def gnisLocaleInstance = GnisLocale.get(id)
        if (!gnisLocaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gnisLocale.label', default: 'GnisLocale'), id])
            redirect(action: "list")
            return
        }

        [gnisLocaleInstance: gnisLocaleInstance]
    }

    def update(Long id, Long version) {
        def gnisLocaleInstance = GnisLocale.get(id)
        if (!gnisLocaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gnisLocale.label', default: 'GnisLocale'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gnisLocaleInstance.version > version) {
                gnisLocaleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gnisLocale.label', default: 'GnisLocale')] as Object[],
                          "Another user has updated this GnisLocale while you were editing")
                render(view: "edit", model: [gnisLocaleInstance: gnisLocaleInstance])
                return
            }
        }

        gnisLocaleInstance.properties = params

        if (!gnisLocaleInstance.save(flush: true)) {
            render(view: "edit", model: [gnisLocaleInstance: gnisLocaleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gnisLocale.label', default: 'GnisLocale'), gnisLocaleInstance.id])
        redirect(action: "show", id: gnisLocaleInstance.id)
    }

    def delete(Long id) {
        def gnisLocaleInstance = GnisLocale.get(id)
        if (!gnisLocaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gnisLocale.label', default: 'GnisLocale'), id])
            redirect(action: "list")
            return
        }

        try {
            gnisLocaleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gnisLocale.label', default: 'GnisLocale'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gnisLocale.label', default: 'GnisLocale'), id])
            redirect(action: "show", id: id)
        }
    }
}
