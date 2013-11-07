package mywebsite

import org.springframework.dao.DataIntegrityViolationException

class NoticeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [noticeInstanceList: Notice.list(params), noticeInstanceTotal: Notice.count()]
    }

    def create() {
        [noticeInstance: new Notice(params)]
    }

    def save() {
        def noticeInstance = new Notice(params)
        if (!noticeInstance.save(flush: true)) {
            render(view: "create", model: [noticeInstance: noticeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'notice.label', default: 'Notice'), noticeInstance.id])
        redirect(action: "show", id: noticeInstance.id)
    }

    def show(Long id) {
        def noticeInstance = Notice.get(id)
        if (!noticeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), id])
            redirect(action: "list")
            return
        }

        [noticeInstance: noticeInstance]
    }

    def edit(Long id) {
        def noticeInstance = Notice.get(id)
        if (!noticeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), id])
            redirect(action: "list")
            return
        }

        [noticeInstance: noticeInstance]
    }

    def update(Long id, Long version) {
        def noticeInstance = Notice.get(id)
        if (!noticeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (noticeInstance.version > version) {
                noticeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'notice.label', default: 'Notice')] as Object[],
                          "Another user has updated this Notice while you were editing")
                render(view: "edit", model: [noticeInstance: noticeInstance])
                return
            }
        }

        noticeInstance.properties = params

        if (!noticeInstance.save(flush: true)) {
            render(view: "edit", model: [noticeInstance: noticeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'notice.label', default: 'Notice'), noticeInstance.id])
        redirect(action: "show", id: noticeInstance.id)
    }

    def delete(Long id) {
        def noticeInstance = Notice.get(id)
        if (!noticeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), id])
            redirect(action: "list")
            return
        }

        try {
            noticeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'notice.label', default: 'Notice'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'notice.label', default: 'Notice'), id])
            redirect(action: "show", id: id)
        }
    }
}
