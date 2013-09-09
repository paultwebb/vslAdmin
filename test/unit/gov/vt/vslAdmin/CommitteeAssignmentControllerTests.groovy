package gov.vt.vslAdmin



import org.junit.*
import grails.test.mixin.*

@TestFor(CommitteeAssignmentController)
@Mock(CommitteeAssignment)
class CommitteeAssignmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/committeeAssignment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.committeeAssignmentInstanceList.size() == 0
        assert model.committeeAssignmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.committeeAssignmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.committeeAssignmentInstance != null
        assert view == '/committeeAssignment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/committeeAssignment/show/1'
        assert controller.flash.message != null
        assert CommitteeAssignment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/committeeAssignment/list'

        populateValidParams(params)
        def committeeAssignment = new CommitteeAssignment(params)

        assert committeeAssignment.save() != null

        params.id = committeeAssignment.id

        def model = controller.show()

        assert model.committeeAssignmentInstance == committeeAssignment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/committeeAssignment/list'

        populateValidParams(params)
        def committeeAssignment = new CommitteeAssignment(params)

        assert committeeAssignment.save() != null

        params.id = committeeAssignment.id

        def model = controller.edit()

        assert model.committeeAssignmentInstance == committeeAssignment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/committeeAssignment/list'

        response.reset()

        populateValidParams(params)
        def committeeAssignment = new CommitteeAssignment(params)

        assert committeeAssignment.save() != null

        // test invalid parameters in update
        params.id = committeeAssignment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/committeeAssignment/edit"
        assert model.committeeAssignmentInstance != null

        committeeAssignment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/committeeAssignment/show/$committeeAssignment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        committeeAssignment.clearErrors()

        populateValidParams(params)
        params.id = committeeAssignment.id
        params.version = -1
        controller.update()

        assert view == "/committeeAssignment/edit"
        assert model.committeeAssignmentInstance != null
        assert model.committeeAssignmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/committeeAssignment/list'

        response.reset()

        populateValidParams(params)
        def committeeAssignment = new CommitteeAssignment(params)

        assert committeeAssignment.save() != null
        assert CommitteeAssignment.count() == 1

        params.id = committeeAssignment.id

        controller.delete()

        assert CommitteeAssignment.count() == 0
        assert CommitteeAssignment.get(committeeAssignment.id) == null
        assert response.redirectedUrl == '/committeeAssignment/list'
    }
}
