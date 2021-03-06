express = require('express')
router = express.Router()
passport = require('passport')
AuthController = requireApp('app/controllers/auth_controller')
UserController = requireApp('app/controllers/user_controller')

router.route('/*').all(UserController.load)

router.get('/', (req, res) -> res.redirect('/projects'))
router.get('/auth/github', passport.authenticate('github'))
router.get('/auth/github/callback', passport.authenticate('github', failureRedirect: '/'), AuthController.callback)

require('./projects')(router)

module.exports = router
