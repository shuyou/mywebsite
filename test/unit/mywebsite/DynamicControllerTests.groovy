package mywebsite



import org.junit.*
import grails.test.mixin.*

@TestFor(DynamicController)
@Mock(Dynamic)
class DynamicControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dynamic/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dynamicInstanceList.size() == 0
        assert model.dynamicInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.dynamicInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dynamicInstance != null
        assert view == '/dynamic/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dynamic/show/1'
        assert controller.flash.message != null
        assert Dynamic.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dynamic/list'

        populateValidParams(params)
        def dynamic = new Dynamic(params)

        assert dynamic.save() != null

        params.id = dynamic.id

        def model = controller.show()

        assert model.dynamicInstance == dynamic
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dynamic/list'

        populateValidParams(params)
        def dynamic = new Dynamic(params)

        assert dynamic.save() != null

        params.id = dynamic.id

        def model = controller.edit()

        assert model.dynamicInstance == dynamic
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dynamic/list'

        response.reset()

        populateValidParams(params)
        def dynamic = new Dynamic(params)

        assert dynamic.save() != null

        // test invalid parameters in update
        params.id = dynamic.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dynamic/edit"
        assert model.dynamicInstance != null

        dynamic.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dynamic/show/$dynamic.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dynamic.clearErrors()

        populateValidParams(params)
        params.id = dynamic.id
        params.version = -1
        controller.update()

        assert view == "/dynamic/edit"
        assert model.dynamicInstance != null
        assert model.dynamicInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dynamic/list'

        response.reset()

        populateValidParams(params)
        def dynamic = new Dynamic(params)

        assert dynamic.save() != null
        assert Dynamic.count() == 1

        params.id = dynamic.id

        controller.delete()

        assert Dynamic.count() == 0
        assert Dynamic.get(dynamic.id) == null
        assert response.redirectedUrl == '/dynamic/list'
    }
}
