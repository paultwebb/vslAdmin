import gov.vt.vslAdmin.User


class BootStrap {
	
    def init = { servletContext ->

		if (!User.count()) {
			new User(login:"admin", password:"admin", firstName:"Admin", lastName:"User").save(failOnError: true)
		}
		
    }
    def destroy = {
    }
}
