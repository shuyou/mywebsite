package mywebsite

import org.springframework.dao.DataIntegrityViolationException

class DynamicController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dynamicInstanceList: Dynamic.list(params), dynamicInstanceTotal: Dynamic.count()]
    }

    def create() {
        [dynamicInstance: new Dynamic(params)]
    }

    def save() {
        def dynamicInstance = new Dynamic(params)
        if (!dynamicInstance.save(flush: true)) {
            render(view: "create", model: [dynamicInstance: dynamicInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dynamic.label', default: 'Dynamic'), dynamicInstance.id])
        redirect(action: "show", id: dynamicInstance.id)
    }

    def show(Long id) {
        def dynamicInstance = Dynamic.get(id)
        if (!dynamicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dynamic.label', default: 'Dynamic'), id])
            redirect(action: "list")
            return
        }

        [dynamicInstance: dynamicInstance]
    }

    def edit(Long id) {
        def dynamicInstance = Dynamic.get(id)
        if (!dynamicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dynamic.label', default: 'Dynamic'), id])
            redirect(action: "list")
            return
        }

        [dynamicInstance: dynamicInstance]
    }

    def update(Long id, Long version) {
        def dynamicInstance = Dynamic.get(id)
        if (!dynamicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dynamic.label', default: 'Dynamic'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dynamicInstance.version > version) {
                dynamicInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dynamic.label', default: 'Dynamic')] as Object[],
                          "Another user has updated this Dynamic while you were editing")
                render(view: "edit", model: [dynamicInstance: dynamicInstance])
                return
            }
        }

        dynamicInstance.properties = params

        if (!dynamicInstance.save(flush: true)) {
            render(view: "edit", model: [dynamicInstance: dynamicInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dynamic.label', default: 'Dynamic'), dynamicInstance.id])
        redirect(action: "show", id: dynamicInstance.id)
    }

    def delete(Long id) {
        def dynamicInstance = Dynamic.get(id)
        if (!dynamicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dynamic.label', default: 'Dynamic'), id])
            redirect(action: "list")
            return
        }

        try {
            dynamicInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dynamic.label', default: 'Dynamic'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dynamic.label', default: 'Dynamic'), id])
            redirect(action: "show", id: id)
        }
    }
}
