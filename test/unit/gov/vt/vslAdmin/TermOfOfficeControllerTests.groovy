package gov.vt.vslAdmin



import org.junit.*
import grails.test.mixin.*

@TestFor(TermOfOfficeController)
@Mock(TermOfOffice)
class TermOfOfficeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/termOfOffice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.termOfOfficeInstanceList.size() == 0
        assert model.termOfOfficeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.termOfOfficeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.termOfOfficeInstance != null
        assert view == '/termOfOffice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/termOfOffice/show/1'
        assert controller.flash.message != null
        assert TermOfOffice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/termOfOffice/list'

        populateValidParams(params)
        def termOfOffice = new TermOfOffice(params)

        assert termOfOffice.save() != null

        params.id = termOfOffice.id

        def model = controller.show()

        assert model.termOfOfficeInstance == termOfOffice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/termOfOffice/list'

        populateValidParams(params)
        def termOfOffice = new TermOfOffice(params)

        assert termOfOffice.save() != null

        params.id = termOfOffice.id

        def model = controller.edit()

        assert model.termOfOfficeInstance == termOfOffice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/termOfOffice/list'

        response.reset()

        populateValidParams(params)
        def termOfOffice = new TermOfOffice(params)

        assert termOfOffice.save() != null

        // test invalid parameters in update
        params.id = termOfOffice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/termOfOffice/edit"
        assert model.termOfOfficeInstance != null

        termOfOffice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/termOfOffice/show/$termOfOffice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        termOfOffice.clearErrors()

        populateValidParams(params)
        params.id = termOfOffice.id
        params.version = -1
        controller.update()

        assert view == "/termOfOffice/edit"
        assert model.termOfOfficeInstance != null
        assert model.termOfOfficeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/termOfOffice/list'

        response.reset()

        populateValidParams(params)
        def termOfOffice = new TermOfOffice(params)

        assert termOfOffice.save() != null
        assert TermOfOffice.count() == 1

        params.id = termOfOffice.id

        controller.delete()

        assert TermOfOffice.count() == 0
        assert TermOfOffice.get(termOfOffice.id) == null
        assert response.redirectedUrl == '/termOfOffice/list'
    }
}
