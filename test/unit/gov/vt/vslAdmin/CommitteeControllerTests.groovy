package gov.vt.vslAdmin



import org.junit.*
import grails.test.mixin.*

@TestFor(CommitteeController)
@Mock(Committee)
class CommitteeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/committee/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.committeeInstanceList.size() == 0
        assert model.committeeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.committeeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.committeeInstance != null
        assert view == '/committee/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/committee/show/1'
        assert controller.flash.message != null
        assert Committee.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/committee/list'

        populateValidParams(params)
        def committee = new Committee(params)

        assert committee.save() != null

        params.id = committee.id

        def model = controller.show()

        assert model.committeeInstance == committee
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/committee/list'

        populateValidParams(params)
        def committee = new Committee(params)

        assert committee.save() != null

        params.id = committee.id

        def model = controller.edit()

        assert model.committeeInstance == committee
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/committee/list'

        response.reset()

        populateValidParams(params)
        def committee = new Committee(params)

        assert committee.save() != null

        // test invalid parameters in update
        params.id = committee.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/committee/edit"
        assert model.committeeInstance != null

        committee.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/committee/show/$committee.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        committee.clearErrors()

        populateValidParams(params)
        params.id = committee.id
        params.version = -1
        controller.update()

        assert view == "/committee/edit"
        assert model.committeeInstance != null
        assert model.committeeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/committee/list'

        response.reset()

        populateValidParams(params)
        def committee = new Committee(params)

        assert committee.save() != null
        assert Committee.count() == 1

        params.id = committee.id

        controller.delete()

        assert Committee.count() == 0
        assert Committee.get(committee.id) == null
        assert response.redirectedUrl == '/committee/list'
    }
}
