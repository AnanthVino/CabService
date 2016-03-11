# @CollectionRules = 
# 	allowIfUserExists: (user_id, doc) ->
# 		user_id?

# 	allowIfUserIsOwner: (user_id, doc) ->
# 		doc.user_id is user_id

# 	allowIfUserIsAdmin: (user_id) ->
# 		UserHelpers.isAdmin user_id
