package mywebsite



import org.junit.*
import grails.test.mixin.*

@TestFor(FairyTaleController)
@Mock(FairyTale)
class FairyTaleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fairyTale/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fairyTaleInstanceList.size() == 0
        assert model.fairyTaleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fairyTaleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fairyTaleInstance != null
        assert view == '/fairyTale/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fairyTale/show/1'
        assert controller.flash.message != null
        assert FairyTale.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fairyTale/list'

        populateValidParams(params)
        def fairyTale = new FairyTale(params)

        assert fairyTale.save() != null

        params.id = fairyTale.id

        def model = controller.show()

        assert model.fairyTaleInstance == fairyTale
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fairyTale/list'

        populateValidParams(params)
        def fairyTale = new FairyTale(params)

        assert fairyTale.save() != null

        params.id = fairyTale.id

        def model = controller.edit()

        assert model.fairyTaleInstance == fairyTale
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fairyTale/list'

        response.reset()

        populateValidParams(params)
        def fairyTale = new FairyTale(params)

        assert fairyTale.save() != null

        // test invalid parameters in update
        params.id = fairyTale.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fairyTale/edit"
        assert model.fairyTaleInstance != null

        fairyTale.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fairyTale/show/$fairyTale.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fairyTale.clearErrors()

        populateValidParams(params)
        params.id = fairyTale.id
        params.version = -1
        controller.update()

        assert view == "/fairyTale/edit"
        assert model.fairyTaleInstance != null
        assert model.fairyTaleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fairyTale/list'

        response.reset()

        populateValidParams(params)
        def fairyTale = new FairyTale(params)

        assert fairyTale.save() != null
        assert FairyTale.count() == 1

        params.id = fairyTale.id

        controller.delete()

        assert FairyTale.count() == 0
        assert FairyTale.get(fairyTale.id) == null
        assert response.redirectedUrl == '/fairyTale/list'
    }
}
