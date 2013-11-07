package mywebsite

import org.springframework.dao.DataIntegrityViolationException

class FairyTaleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [fairyTaleInstanceList: FairyTale.list(params), fairyTaleInstanceTotal: FairyTale.count()]
    }

    def create() {
        [fairyTaleInstance: new FairyTale(params)]
    }

    def save() {
        def fairyTaleInstance = new FairyTale(params)
        if (!fairyTaleInstance.save(flush: true)) {
            render(view: "create", model: [fairyTaleInstance: fairyTaleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'fairyTale.label', default: 'FairyTale'), fairyTaleInstance.id])
        redirect(action: "show", id: fairyTaleInstance.id)
    }

    def show(Long id) {
        def fairyTaleInstance = FairyTale.get(id)
        if (!fairyTaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fairyTale.label', default: 'FairyTale'), id])
            redirect(action: "list")
            return
        }

        [fairyTaleInstance: fairyTaleInstance]
    }

    def edit(Long id) {
        def fairyTaleInstance = FairyTale.get(id)
        if (!fairyTaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fairyTale.label', default: 'FairyTale'), id])
            redirect(action: "list")
            return
        }

        [fairyTaleInstance: fairyTaleInstance]
    }

    def update(Long id, Long version) {
        def fairyTaleInstance = FairyTale.get(id)
        if (!fairyTaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fairyTale.label', default: 'FairyTale'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fairyTaleInstance.version > version) {
                fairyTaleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fairyTale.label', default: 'FairyTale')] as Object[],
                          "Another user has updated this FairyTale while you were editing")
                render(view: "edit", model: [fairyTaleInstance: fairyTaleInstance])
                return
            }
        }

        fairyTaleInstance.properties = params

        if (!fairyTaleInstance.save(flush: true)) {
            render(view: "edit", model: [fairyTaleInstance: fairyTaleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'fairyTale.label', default: 'FairyTale'), fairyTaleInstance.id])
        redirect(action: "show", id: fairyTaleInstance.id)
    }

    def delete(Long id) {
        def fairyTaleInstance = FairyTale.get(id)
        if (!fairyTaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fairyTale.label', default: 'FairyTale'), id])
            redirect(action: "list")
            return
        }

        try {
            fairyTaleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fairyTale.label', default: 'FairyTale'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fairyTale.label', default: 'FairyTale'), id])
            redirect(action: "show", id: id)
        }
    }
}
