package gov.vt.vslAdmin

import org.springframework.dao.DataIntegrityViolationException

class CommitteeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [committeeInstanceList: Committee.list(params), committeeInstanceTotal: Committee.count()]
    }

    def create() {
        [committeeInstance: new Committee(params)]
    }

    def save() {
        def committeeInstance = new Committee(params)
        if (!committeeInstance.save(flush: true)) {
            render(view: "create", model: [committeeInstance: committeeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'committee.label', default: 'Committee'), committeeInstance.id])
        redirect(action: "show", id: committeeInstance.id)
    }

    def show(Long id) {
        def committeeInstance = Committee.get(id)
        if (!committeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'committee.label', default: 'Committee'), id])
            redirect(action: "list")
            return
        }

        [committeeInstance: committeeInstance]
    }

    def edit(Long id) {
        def committeeInstance = Committee.get(id)
        if (!committeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'committee.label', default: 'Committee'), id])
            redirect(action: "list")
            return
        }

        [committeeInstance: committeeInstance]
    }

    def update(Long id, Long version) {
        def committeeInstance = Committee.get(id)
        if (!committeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'committee.label', default: 'Committee'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (committeeInstance.version > version) {
                committeeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'committee.label', default: 'Committee')] as Object[],
                          "Another user has updated this Committee while you were editing")
                render(view: "edit", model: [committeeInstance: committeeInstance])
                return
            }
        }

        committeeInstance.properties = params

        if (!committeeInstance.save(flush: true)) {
            render(view: "edit", model: [committeeInstance: committeeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'committee.label', default: 'Committee'), committeeInstance.id])
        redirect(action: "show", id: committeeInstance.id)
    }

    def delete(Long id) {
        def committeeInstance = Committee.get(id)
        if (!committeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'committee.label', default: 'Committee'), id])
            redirect(action: "list")
            return
        }

        try {
            committeeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'committee.label', default: 'Committee'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'committee.label', default: 'Committee'), id])
            redirect(action: "show", id: id)
        }
    }
}
