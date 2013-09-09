package gov.vt.vslAdmin



import org.junit.*
import grails.test.mixin.*

@TestFor(OfficeHolderController)
@Mock(OfficeHolder)
class OfficeHolderControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/officeHolder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.officeHolderInstanceList.size() == 0
        assert model.officeHolderInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.officeHolderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.officeHolderInstance != null
        assert view == '/officeHolder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/officeHolder/show/1'
        assert controller.flash.message != null
        assert OfficeHolder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/officeHolder/list'

        populateValidParams(params)
        def officeHolder = new OfficeHolder(params)

        assert officeHolder.save() != null

        params.id = officeHolder.id

        def model = controller.show()

        assert model.officeHolderInstance == officeHolder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/officeHolder/list'

        populateValidParams(params)
        def officeHolder = new OfficeHolder(params)

        assert officeHolder.save() != null

        params.id = officeHolder.id

        def model = controller.edit()

        assert model.officeHolderInstance == officeHolder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/officeHolder/list'

        response.reset()

        populateValidParams(params)
        def officeHolder = new OfficeHolder(params)

        assert officeHolder.save() != null

        // test invalid parameters in update
        params.id = officeHolder.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/officeHolder/edit"
        assert model.officeHolderInstance != null

        officeHolder.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/officeHolder/show/$officeHolder.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        officeHolder.clearErrors()

        populateValidParams(params)
        params.id = officeHolder.id
        params.version = -1
        controller.update()

        assert view == "/officeHolder/edit"
        assert model.officeHolderInstance != null
        assert model.officeHolderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/officeHolder/list'

        response.reset()

        populateValidParams(params)
        def officeHolder = new OfficeHolder(params)

        assert officeHolder.save() != null
        assert OfficeHolder.count() == 1

        params.id = officeHolder.id

        controller.delete()

        assert OfficeHolder.count() == 0
        assert OfficeHolder.get(officeHolder.id) == null
        assert response.redirectedUrl == '/officeHolder/list'
    }
}
