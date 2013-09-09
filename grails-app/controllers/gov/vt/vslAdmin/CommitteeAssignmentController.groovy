package gov.vt.vslAdmin

import org.springframework.dao.DataIntegrityViolationException

class CommitteeAssignmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [committeeAssignmentInstanceList: CommitteeAssignment.list(params), committeeAssignmentInstanceTotal: CommitteeAssignment.count()]
    }

    def create() {
        [committeeAssignmentInstance: new CommitteeAssignment(params)]
    }

    def save() {
        def committeeAssignmentInstance = new CommitteeAssignment(params)
        if (!committeeAssignmentInstance.save(flush: true)) {
            render(view: "create", model: [committeeAssignmentInstance: committeeAssignmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment'), committeeAssignmentInstance.id])
        redirect(action: "show", id: committeeAssignmentInstance.id)
    }

    def show(Long id) {
        def committeeAssignmentInstance = CommitteeAssignment.get(id)
        if (!committeeAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment'), id])
            redirect(action: "list")
            return
        }

        [committeeAssignmentInstance: committeeAssignmentInstance]
    }

    def edit(Long id) {
        def committeeAssignmentInstance = CommitteeAssignment.get(id)
        if (!committeeAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment'), id])
            redirect(action: "list")
            return
        }

        [committeeAssignmentInstance: committeeAssignmentInstance]
    }

    def update(Long id, Long version) {
        def committeeAssignmentInstance = CommitteeAssignment.get(id)
        if (!committeeAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (committeeAssignmentInstance.version > version) {
                committeeAssignmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment')] as Object[],
                          "Another user has updated this CommitteeAssignment while you were editing")
                render(view: "edit", model: [committeeAssignmentInstance: committeeAssignmentInstance])
                return
            }
        }

        committeeAssignmentInstance.properties = params

        if (!committeeAssignmentInstance.save(flush: true)) {
            render(view: "edit", model: [committeeAssignmentInstance: committeeAssignmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment'), committeeAssignmentInstance.id])
        redirect(action: "show", id: committeeAssignmentInstance.id)
    }

    def delete(Long id) {
        def committeeAssignmentInstance = CommitteeAssignment.get(id)
        if (!committeeAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment'), id])
            redirect(action: "list")
            return
        }

        try {
            committeeAssignmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment'), id])
            redirect(action: "show", id: id)
        }
    }
}
