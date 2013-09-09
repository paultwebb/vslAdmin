package gov.vt.vslAdmin

import org.springframework.dao.DataIntegrityViolationException

class TermOfOfficeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [termOfOfficeInstanceList: TermOfOffice.list(params), termOfOfficeInstanceTotal: TermOfOffice.count()]
    }

    def create() {
        [termOfOfficeInstance: new TermOfOffice(params)]
    }

    def save() {
        def termOfOfficeInstance = new TermOfOffice(params)
        if (!termOfOfficeInstance.save(flush: true)) {
            render(view: "create", model: [termOfOfficeInstance: termOfOfficeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice'), termOfOfficeInstance.id])
        redirect(action: "show", id: termOfOfficeInstance.id)
    }

    def show(Long id) {
        def termOfOfficeInstance = TermOfOffice.get(id)
        if (!termOfOfficeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice'), id])
            redirect(action: "list")
            return
        }

        [termOfOfficeInstance: termOfOfficeInstance]
    }

    def edit(Long id) {
        def termOfOfficeInstance = TermOfOffice.get(id)
        if (!termOfOfficeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice'), id])
            redirect(action: "list")
            return
        }

        [termOfOfficeInstance: termOfOfficeInstance]
    }

    def update(Long id, Long version) {
        def termOfOfficeInstance = TermOfOffice.get(id)
        if (!termOfOfficeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (termOfOfficeInstance.version > version) {
                termOfOfficeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'termOfOffice.label', default: 'TermOfOffice')] as Object[],
                          "Another user has updated this TermOfOffice while you were editing")
                render(view: "edit", model: [termOfOfficeInstance: termOfOfficeInstance])
                return
            }
        }

        termOfOfficeInstance.properties = params

        if (!termOfOfficeInstance.save(flush: true)) {
            render(view: "edit", model: [termOfOfficeInstance: termOfOfficeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice'), termOfOfficeInstance.id])
        redirect(action: "show", id: termOfOfficeInstance.id)
    }

    def delete(Long id) {
        def termOfOfficeInstance = TermOfOffice.get(id)
        if (!termOfOfficeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice'), id])
            redirect(action: "list")
            return
        }

        try {
            termOfOfficeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice'), id])
            redirect(action: "show", id: id)
        }
    }
}
