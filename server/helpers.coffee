#### HELPERS ####

module.exports = (app) ->

  # This fetches the user from the session
  app.helpers.fetchUserFromSession = (req, res, next) ->
    app.models.User.findOne {_id: req.session.userId}, (err, user) ->
      if !err and user?
        next user
      else
        res status: 'failure', reason: err || "User not found"