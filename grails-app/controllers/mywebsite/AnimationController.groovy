package mywebsite

import org.springframework.dao.DataIntegrityViolationException

class AnimationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [animationInstanceList: Animation.list(params), animationInstanceTotal: Animation.count()]
    }

    def create() {
        [animationInstance: new Animation(params)]
    }

    def save() {
        def animationInstance = new Animation(params)
        if (!animationInstance.save(flush: true)) {
            render(view: "create", model: [animationInstance: animationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'animation.label', default: 'Animation'), animationInstance.id])
        redirect(action: "show", id: animationInstance.id)
    }

    def show(Long id) {
        def animationInstance = Animation.get(id)
        if (!animationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animation.label', default: 'Animation'), id])
            redirect(action: "list")
            return
        }

        [animationInstance: animationInstance]
    }

    def edit(Long id) {
        def animationInstance = Animation.get(id)
        if (!animationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animation.label', default: 'Animation'), id])
            redirect(action: "list")
            return
        }

        [animationInstance: animationInstance]
    }

    def update(Long id, Long version) {
        def animationInstance = Animation.get(id)
        if (!animationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animation.label', default: 'Animation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (animationInstance.version > version) {
                animationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'animation.label', default: 'Animation')] as Object[],
                          "Another user has updated this Animation while you were editing")
                render(view: "edit", model: [animationInstance: animationInstance])
                return
            }
        }

        animationInstance.properties = params

        if (!animationInstance.save(flush: true)) {
            render(view: "edit", model: [animationInstance: animationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'animation.label', default: 'Animation'), animationInstance.id])
        redirect(action: "show", id: animationInstance.id)
    }

    def delete(Long id) {
        def animationInstance = Animation.get(id)
        if (!animationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animation.label', default: 'Animation'), id])
            redirect(action: "list")
            return
        }

        try {
            animationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'animation.label', default: 'Animation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'animation.label', default: 'Animation'), id])
            redirect(action: "show", id: id)
        }
    }
}
