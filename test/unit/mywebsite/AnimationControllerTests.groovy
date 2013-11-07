package mywebsite



import org.junit.*
import grails.test.mixin.*

@TestFor(AnimationController)
@Mock(Animation)
class AnimationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/animation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.animationInstanceList.size() == 0
        assert model.animationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.animationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.animationInstance != null
        assert view == '/animation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/animation/show/1'
        assert controller.flash.message != null
        assert Animation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/animation/list'

        populateValidParams(params)
        def animation = new Animation(params)

        assert animation.save() != null

        params.id = animation.id

        def model = controller.show()

        assert model.animationInstance == animation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/animation/list'

        populateValidParams(params)
        def animation = new Animation(params)

        assert animation.save() != null

        params.id = animation.id

        def model = controller.edit()

        assert model.animationInstance == animation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/animation/list'

        response.reset()

        populateValidParams(params)
        def animation = new Animation(params)

        assert animation.save() != null

        // test invalid parameters in update
        params.id = animation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/animation/edit"
        assert model.animationInstance != null

        animation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/animation/show/$animation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        animation.clearErrors()

        populateValidParams(params)
        params.id = animation.id
        params.version = -1
        controller.update()

        assert view == "/animation/edit"
        assert model.animationInstance != null
        assert model.animationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/animation/list'

        response.reset()

        populateValidParams(params)
        def animation = new Animation(params)

        assert animation.save() != null
        assert Animation.count() == 1

        params.id = animation.id

        controller.delete()

        assert Animation.count() == 0
        assert Animation.get(animation.id) == null
        assert response.redirectedUrl == '/animation/list'
    }
}
