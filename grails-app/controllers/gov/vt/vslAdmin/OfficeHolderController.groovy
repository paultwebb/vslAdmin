package gov.vt.vslAdmin

import org.springframework.dao.DataIntegrityViolationException

class OfficeHolderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [officeHolderInstanceList: OfficeHolder.list(params), officeHolderInstanceTotal: OfficeHolder.count()]
    }

    def create() {
        [officeHolderInstance: new OfficeHolder(params)]
    }

    def save() {
        def officeHolderInstance = new OfficeHolder(params)
        if (!officeHolderInstance.save(flush: true)) {
            render(view: "create", model: [officeHolderInstance: officeHolderInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'officeHolder.label', default: 'OfficeHolder'), officeHolderInstance.id])
        redirect(action: "show", id: officeHolderInstance.id)
    }

    def show(Long id) {
        def officeHolderInstance = OfficeHolder.get(id)
        if (!officeHolderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'officeHolder.label', default: 'OfficeHolder'), id])
            redirect(action: "list")
            return
        }

        [officeHolderInstance: officeHolderInstance]
    }

    def edit(Long id) {
        def officeHolderInstance = OfficeHolder.get(id)
        if (!officeHolderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'officeHolder.label', default: 'OfficeHolder'), id])
            redirect(action: "list")
            return
        }

        [officeHolderInstance: officeHolderInstance]
    }

    def update(Long id, Long version) {
        def officeHolderInstance = OfficeHolder.get(id)
        if (!officeHolderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'officeHolder.label', default: 'OfficeHolder'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (officeHolderInstance.version > version) {
                officeHolderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'officeHolder.label', default: 'OfficeHolder')] as Object[],
                          "Another user has updated this OfficeHolder while you were editing")
                render(view: "edit", model: [officeHolderInstance: officeHolderInstance])
                return
            }
        }

        officeHolderInstance.properties = params

        if (!officeHolderInstance.save(flush: true)) {
            render(view: "edit", model: [officeHolderInstance: officeHolderInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'officeHolder.label', default: 'OfficeHolder'), officeHolderInstance.id])
        redirect(action: "show", id: officeHolderInstance.id)
    }

    def delete(Long id) {
        def officeHolderInstance = OfficeHolder.get(id)
        if (!officeHolderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'officeHolder.label', default: 'OfficeHolder'), id])
            redirect(action: "list")
            return
        }

        try {
            officeHolderInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'officeHolder.label', default: 'OfficeHolder'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'officeHolder.label', default: 'OfficeHolder'), id])
            redirect(action: "show", id: id)
        }
    }
}
