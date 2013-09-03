package gov.vt.vslAdmin

import gov.vt.vslAdmin.User;

class UserController {

    def index() { }
	
	def login = { LoginCommand cmd ->
		if(request.method == 'POST') {
			if(!cmd.hasErrors()) {
				session.user = cmd.getUser()
				redirect(controller:'search')
			}
			else {
				render(view:'/search/index', model:[loginCmd:cmd])
			}
		}
		else {
			render(view:'/search/index')
		}
	}
	
	def logout = {
		session.invalidate()
		redirect(controller:"search")
	}
	
	def register = {
		if(request.method == 'POST') {
			def u = new User(params)
			if(u.password != params.confirm) {
				u.errors.rejectValue("password", "user.password.dontmatch")
				return [user:u]
			}
			else if(u.save()) {
				session.user = u
				redirect(controller:"search")
			}
			else {
				return [user:u]
			}
		}
	}
}
		
class LoginCommand {
		String login
		String password
		private u
		User getUser() {
			if(!u && login)
				u = User.findByLogin(login)
			return u
		}
		static constraints = {
			login blank:false, validator:{ val, obj ->
				if(!obj.user)
					return "user.not.found"
			}
			password blank:false, validator:{ val, obj ->
				if(obj.user && obj.user.password != val)
					return "user.password.invalid"
			}
		}
}
	

