package mywebsite



import org.junit.*
import grails.test.mixin.*

@TestFor(NoticeController)
@Mock(Notice)
class NoticeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/notice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.noticeInstanceList.size() == 0
        assert model.noticeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.noticeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.noticeInstance != null
        assert view == '/notice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/notice/show/1'
        assert controller.flash.message != null
        assert Notice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/notice/list'

        populateValidParams(params)
        def notice = new Notice(params)

        assert notice.save() != null

        params.id = notice.id

        def model = controller.show()

        assert model.noticeInstance == notice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/notice/list'

        populateValidParams(params)
        def notice = new Notice(params)

        assert notice.save() != null

        params.id = notice.id

        def model = controller.edit()

        assert model.noticeInstance == notice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/notice/list'

        response.reset()

        populateValidParams(params)
        def notice = new Notice(params)

        assert notice.save() != null

        // test invalid parameters in update
        params.id = notice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/notice/edit"
        assert model.noticeInstance != null

        notice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/notice/show/$notice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        notice.clearErrors()

        populateValidParams(params)
        params.id = notice.id
        params.version = -1
        controller.update()

        assert view == "/notice/edit"
        assert model.noticeInstance != null
        assert model.noticeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/notice/list'

        response.reset()

        populateValidParams(params)
        def notice = new Notice(params)

        assert notice.save() != null
        assert Notice.count() == 1

        params.id = notice.id

        controller.delete()

        assert Notice.count() == 0
        assert Notice.get(notice.id) == null
        assert response.redirectedUrl == '/notice/list'
    }
}
