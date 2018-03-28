json.users @users do |user|
	json.id user.id.to_s
	json.name user.name
	json.age  user.age
	json.email user.email
end
